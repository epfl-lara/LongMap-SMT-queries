; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111864 () Bool)

(assert start!111864)

(declare-fun b_free!30463 () Bool)

(declare-fun b_next!30463 () Bool)

(assert (=> start!111864 (= b_free!30463 (not b_next!30463))))

(declare-fun tp!106870 () Bool)

(declare-fun b_and!49003 () Bool)

(assert (=> start!111864 (= tp!106870 b_and!49003)))

(declare-fun b!1325313 () Bool)

(declare-fun res!879608 () Bool)

(declare-fun e!755536 () Bool)

(assert (=> b!1325313 (=> (not res!879608) (not e!755536))))

(declare-datatypes ((array!89409 0))(
  ( (array!89410 (arr!43178 (Array (_ BitVec 32) (_ BitVec 64))) (size!43730 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89409)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53481 0))(
  ( (V!53482 (val!18216 Int)) )
))
(declare-datatypes ((ValueCell!17243 0))(
  ( (ValueCellFull!17243 (v!20848 V!53481)) (EmptyCell!17243) )
))
(declare-datatypes ((array!89411 0))(
  ( (array!89412 (arr!43179 (Array (_ BitVec 32) ValueCell!17243)) (size!43731 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89411)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1325313 (= res!879608 (and (= (size!43731 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43730 _keys!1609) (size!43731 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325314 () Bool)

(declare-fun e!755537 () Bool)

(declare-fun e!755538 () Bool)

(declare-fun mapRes!56076 () Bool)

(assert (=> b!1325314 (= e!755537 (and e!755538 mapRes!56076))))

(declare-fun condMapEmpty!56076 () Bool)

(declare-fun mapDefault!56076 () ValueCell!17243)

(assert (=> b!1325314 (= condMapEmpty!56076 (= (arr!43179 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17243)) mapDefault!56076)))))

(declare-fun b!1325315 () Bool)

(declare-fun tp_is_empty!36283 () Bool)

(assert (=> b!1325315 (= e!755538 tp_is_empty!36283)))

(declare-fun b!1325316 () Bool)

(assert (=> b!1325316 (= e!755536 false)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53481)

(declare-fun minValue!1279 () V!53481)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!589593 () Bool)

(declare-datatypes ((tuple2!23560 0))(
  ( (tuple2!23561 (_1!11791 (_ BitVec 64)) (_2!11791 V!53481)) )
))
(declare-datatypes ((List!30689 0))(
  ( (Nil!30686) (Cons!30685 (h!31894 tuple2!23560) (t!44615 List!30689)) )
))
(declare-datatypes ((ListLongMap!21217 0))(
  ( (ListLongMap!21218 (toList!10624 List!30689)) )
))
(declare-fun contains!8708 (ListLongMap!21217 (_ BitVec 64)) Bool)

(declare-fun +!4632 (ListLongMap!21217 tuple2!23560) ListLongMap!21217)

(declare-fun getCurrentListMapNoExtraKeys!6270 (array!89409 array!89411 (_ BitVec 32) (_ BitVec 32) V!53481 V!53481 (_ BitVec 32) Int) ListLongMap!21217)

(declare-fun get!21748 (ValueCell!17243 V!53481) V!53481)

(declare-fun dynLambda!3562 (Int (_ BitVec 64)) V!53481)

(assert (=> b!1325316 (= lt!589593 (contains!8708 (+!4632 (+!4632 (+!4632 (getCurrentListMapNoExtraKeys!6270 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23561 (select (arr!43178 _keys!1609) from!2000) (get!21748 (select (arr!43179 _values!1337) from!2000) (dynLambda!3562 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23561 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23561 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164))))

(declare-fun b!1325317 () Bool)

(declare-fun res!879609 () Bool)

(assert (=> b!1325317 (=> (not res!879609) (not e!755536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89409 (_ BitVec 32)) Bool)

(assert (=> b!1325317 (= res!879609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!879607 () Bool)

(assert (=> start!111864 (=> (not res!879607) (not e!755536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111864 (= res!879607 (validMask!0 mask!2019))))

(assert (=> start!111864 e!755536))

(declare-fun array_inv!32777 (array!89409) Bool)

(assert (=> start!111864 (array_inv!32777 _keys!1609)))

(assert (=> start!111864 true))

(assert (=> start!111864 tp_is_empty!36283))

(declare-fun array_inv!32778 (array!89411) Bool)

(assert (=> start!111864 (and (array_inv!32778 _values!1337) e!755537)))

(assert (=> start!111864 tp!106870))

(declare-fun b!1325318 () Bool)

(declare-fun res!879611 () Bool)

(assert (=> b!1325318 (=> (not res!879611) (not e!755536))))

(declare-fun getCurrentListMap!5502 (array!89409 array!89411 (_ BitVec 32) (_ BitVec 32) V!53481 V!53481 (_ BitVec 32) Int) ListLongMap!21217)

(assert (=> b!1325318 (= res!879611 (contains!8708 (getCurrentListMap!5502 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1325319 () Bool)

(declare-fun e!755535 () Bool)

(assert (=> b!1325319 (= e!755535 tp_is_empty!36283)))

(declare-fun mapNonEmpty!56076 () Bool)

(declare-fun tp!106869 () Bool)

(assert (=> mapNonEmpty!56076 (= mapRes!56076 (and tp!106869 e!755535))))

(declare-fun mapKey!56076 () (_ BitVec 32))

(declare-fun mapRest!56076 () (Array (_ BitVec 32) ValueCell!17243))

(declare-fun mapValue!56076 () ValueCell!17243)

(assert (=> mapNonEmpty!56076 (= (arr!43179 _values!1337) (store mapRest!56076 mapKey!56076 mapValue!56076))))

(declare-fun mapIsEmpty!56076 () Bool)

(assert (=> mapIsEmpty!56076 mapRes!56076))

(declare-fun b!1325320 () Bool)

(declare-fun res!879604 () Bool)

(assert (=> b!1325320 (=> (not res!879604) (not e!755536))))

(assert (=> b!1325320 (= res!879604 (not (= (select (arr!43178 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1325321 () Bool)

(declare-fun res!879605 () Bool)

(assert (=> b!1325321 (=> (not res!879605) (not e!755536))))

(declare-datatypes ((List!30690 0))(
  ( (Nil!30687) (Cons!30686 (h!31895 (_ BitVec 64)) (t!44616 List!30690)) )
))
(declare-fun arrayNoDuplicates!0 (array!89409 (_ BitVec 32) List!30690) Bool)

(assert (=> b!1325321 (= res!879605 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30687))))

(declare-fun b!1325322 () Bool)

(declare-fun res!879610 () Bool)

(assert (=> b!1325322 (=> (not res!879610) (not e!755536))))

(assert (=> b!1325322 (= res!879610 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43730 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325323 () Bool)

(declare-fun res!879606 () Bool)

(assert (=> b!1325323 (=> (not res!879606) (not e!755536))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325323 (= res!879606 (validKeyInArray!0 (select (arr!43178 _keys!1609) from!2000)))))

(assert (= (and start!111864 res!879607) b!1325313))

(assert (= (and b!1325313 res!879608) b!1325317))

(assert (= (and b!1325317 res!879609) b!1325321))

(assert (= (and b!1325321 res!879605) b!1325322))

(assert (= (and b!1325322 res!879610) b!1325318))

(assert (= (and b!1325318 res!879611) b!1325320))

(assert (= (and b!1325320 res!879604) b!1325323))

(assert (= (and b!1325323 res!879606) b!1325316))

(assert (= (and b!1325314 condMapEmpty!56076) mapIsEmpty!56076))

(assert (= (and b!1325314 (not condMapEmpty!56076)) mapNonEmpty!56076))

(get-info :version)

(assert (= (and mapNonEmpty!56076 ((_ is ValueCellFull!17243) mapValue!56076)) b!1325319))

(assert (= (and b!1325314 ((_ is ValueCellFull!17243) mapDefault!56076)) b!1325315))

(assert (= start!111864 b!1325314))

(declare-fun b_lambda!23731 () Bool)

(assert (=> (not b_lambda!23731) (not b!1325316)))

(declare-fun t!44614 () Bool)

(declare-fun tb!11729 () Bool)

(assert (=> (and start!111864 (= defaultEntry!1340 defaultEntry!1340) t!44614) tb!11729))

(declare-fun result!24523 () Bool)

(assert (=> tb!11729 (= result!24523 tp_is_empty!36283)))

(assert (=> b!1325316 t!44614))

(declare-fun b_and!49005 () Bool)

(assert (= b_and!49003 (and (=> t!44614 result!24523) b_and!49005)))

(declare-fun m!1213753 () Bool)

(assert (=> b!1325320 m!1213753))

(declare-fun m!1213755 () Bool)

(assert (=> b!1325317 m!1213755))

(declare-fun m!1213757 () Bool)

(assert (=> mapNonEmpty!56076 m!1213757))

(declare-fun m!1213759 () Bool)

(assert (=> b!1325318 m!1213759))

(assert (=> b!1325318 m!1213759))

(declare-fun m!1213761 () Bool)

(assert (=> b!1325318 m!1213761))

(assert (=> b!1325323 m!1213753))

(assert (=> b!1325323 m!1213753))

(declare-fun m!1213763 () Bool)

(assert (=> b!1325323 m!1213763))

(declare-fun m!1213765 () Bool)

(assert (=> start!111864 m!1213765))

(declare-fun m!1213767 () Bool)

(assert (=> start!111864 m!1213767))

(declare-fun m!1213769 () Bool)

(assert (=> start!111864 m!1213769))

(declare-fun m!1213771 () Bool)

(assert (=> b!1325316 m!1213771))

(declare-fun m!1213773 () Bool)

(assert (=> b!1325316 m!1213773))

(assert (=> b!1325316 m!1213771))

(declare-fun m!1213775 () Bool)

(assert (=> b!1325316 m!1213775))

(declare-fun m!1213777 () Bool)

(assert (=> b!1325316 m!1213777))

(declare-fun m!1213779 () Bool)

(assert (=> b!1325316 m!1213779))

(declare-fun m!1213781 () Bool)

(assert (=> b!1325316 m!1213781))

(assert (=> b!1325316 m!1213775))

(declare-fun m!1213783 () Bool)

(assert (=> b!1325316 m!1213783))

(assert (=> b!1325316 m!1213753))

(assert (=> b!1325316 m!1213783))

(assert (=> b!1325316 m!1213777))

(assert (=> b!1325316 m!1213781))

(assert (=> b!1325316 m!1213773))

(declare-fun m!1213785 () Bool)

(assert (=> b!1325316 m!1213785))

(declare-fun m!1213787 () Bool)

(assert (=> b!1325321 m!1213787))

(check-sat b_and!49005 (not b_next!30463) (not start!111864) (not mapNonEmpty!56076) tp_is_empty!36283 (not b!1325323) (not b!1325316) (not b!1325318) (not b!1325321) (not b!1325317) (not b_lambda!23731))
(check-sat b_and!49005 (not b_next!30463))
