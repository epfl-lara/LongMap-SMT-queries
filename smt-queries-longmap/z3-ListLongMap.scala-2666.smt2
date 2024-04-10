; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39816 () Bool)

(assert start!39816)

(declare-fun b_free!10083 () Bool)

(declare-fun b_next!10083 () Bool)

(assert (=> start!39816 (= b_free!10083 (not b_next!10083))))

(declare-fun tp!35777 () Bool)

(declare-fun b_and!17825 () Bool)

(assert (=> start!39816 (= tp!35777 b_and!17825)))

(declare-fun b!429787 () Bool)

(declare-fun res!252460 () Bool)

(declare-fun e!254519 () Bool)

(assert (=> b!429787 (=> (not res!252460) (not e!254519))))

(declare-datatypes ((array!26305 0))(
  ( (array!26306 (arr!12602 (Array (_ BitVec 32) (_ BitVec 64))) (size!12954 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26305)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429787 (= res!252460 (or (= (select (arr!12602 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12602 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429788 () Bool)

(declare-fun e!254520 () Bool)

(declare-fun e!254523 () Bool)

(declare-fun mapRes!18474 () Bool)

(assert (=> b!429788 (= e!254520 (and e!254523 mapRes!18474))))

(declare-fun condMapEmpty!18474 () Bool)

(declare-datatypes ((V!16085 0))(
  ( (V!16086 (val!5662 Int)) )
))
(declare-datatypes ((ValueCell!5274 0))(
  ( (ValueCellFull!5274 (v!7909 V!16085)) (EmptyCell!5274) )
))
(declare-datatypes ((array!26307 0))(
  ( (array!26308 (arr!12603 (Array (_ BitVec 32) ValueCell!5274)) (size!12955 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26307)

(declare-fun mapDefault!18474 () ValueCell!5274)

(assert (=> b!429788 (= condMapEmpty!18474 (= (arr!12603 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5274)) mapDefault!18474)))))

(declare-fun b!429789 () Bool)

(declare-fun tp_is_empty!11235 () Bool)

(assert (=> b!429789 (= e!254523 tp_is_empty!11235)))

(declare-fun b!429790 () Bool)

(declare-fun res!252450 () Bool)

(assert (=> b!429790 (=> (not res!252450) (not e!254519))))

(assert (=> b!429790 (= res!252450 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12954 _keys!709))))))

(declare-fun b!429791 () Bool)

(declare-fun e!254521 () Bool)

(declare-fun e!254518 () Bool)

(assert (=> b!429791 (= e!254521 (not e!254518))))

(declare-fun res!252456 () Bool)

(assert (=> b!429791 (=> res!252456 e!254518)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429791 (= res!252456 (not (validKeyInArray!0 (select (arr!12602 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7456 0))(
  ( (tuple2!7457 (_1!3739 (_ BitVec 64)) (_2!3739 V!16085)) )
))
(declare-datatypes ((List!7472 0))(
  ( (Nil!7469) (Cons!7468 (h!8324 tuple2!7456) (t!13004 List!7472)) )
))
(declare-datatypes ((ListLongMap!6369 0))(
  ( (ListLongMap!6370 (toList!3200 List!7472)) )
))
(declare-fun lt!196440 () ListLongMap!6369)

(declare-fun lt!196442 () ListLongMap!6369)

(assert (=> b!429791 (= lt!196440 lt!196442)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!196445 () ListLongMap!6369)

(declare-fun v!412 () V!16085)

(declare-fun +!1349 (ListLongMap!6369 tuple2!7456) ListLongMap!6369)

(assert (=> b!429791 (= lt!196442 (+!1349 lt!196445 (tuple2!7457 k0!794 v!412)))))

(declare-fun minValue!515 () V!16085)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!196444 () array!26305)

(declare-fun zeroValue!515 () V!16085)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!196438 () array!26307)

(declare-fun getCurrentListMapNoExtraKeys!1402 (array!26305 array!26307 (_ BitVec 32) (_ BitVec 32) V!16085 V!16085 (_ BitVec 32) Int) ListLongMap!6369)

(assert (=> b!429791 (= lt!196440 (getCurrentListMapNoExtraKeys!1402 lt!196444 lt!196438 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!429791 (= lt!196445 (getCurrentListMapNoExtraKeys!1402 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12633 0))(
  ( (Unit!12634) )
))
(declare-fun lt!196437 () Unit!12633)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!538 (array!26305 array!26307 (_ BitVec 32) (_ BitVec 32) V!16085 V!16085 (_ BitVec 32) (_ BitVec 64) V!16085 (_ BitVec 32) Int) Unit!12633)

(assert (=> b!429791 (= lt!196437 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!538 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429792 () Bool)

(declare-fun res!252453 () Bool)

(assert (=> b!429792 (=> (not res!252453) (not e!254519))))

(assert (=> b!429792 (= res!252453 (and (= (size!12955 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12954 _keys!709) (size!12955 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429793 () Bool)

(declare-fun res!252455 () Bool)

(assert (=> b!429793 (=> (not res!252455) (not e!254519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429793 (= res!252455 (validMask!0 mask!1025))))

(declare-fun b!429794 () Bool)

(declare-fun e!254515 () Bool)

(assert (=> b!429794 (= e!254519 e!254515)))

(declare-fun res!252449 () Bool)

(assert (=> b!429794 (=> (not res!252449) (not e!254515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26305 (_ BitVec 32)) Bool)

(assert (=> b!429794 (= res!252449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196444 mask!1025))))

(assert (=> b!429794 (= lt!196444 (array!26306 (store (arr!12602 _keys!709) i!563 k0!794) (size!12954 _keys!709)))))

(declare-fun b!429795 () Bool)

(declare-fun e!254517 () Unit!12633)

(declare-fun Unit!12635 () Unit!12633)

(assert (=> b!429795 (= e!254517 Unit!12635)))

(declare-fun b!429796 () Bool)

(declare-fun e!254522 () Bool)

(assert (=> b!429796 (= e!254522 tp_is_empty!11235)))

(declare-fun b!429797 () Bool)

(declare-fun res!252454 () Bool)

(assert (=> b!429797 (=> (not res!252454) (not e!254519))))

(assert (=> b!429797 (= res!252454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429798 () Bool)

(declare-fun res!252452 () Bool)

(assert (=> b!429798 (=> (not res!252452) (not e!254515))))

(declare-datatypes ((List!7473 0))(
  ( (Nil!7470) (Cons!7469 (h!8325 (_ BitVec 64)) (t!13005 List!7473)) )
))
(declare-fun arrayNoDuplicates!0 (array!26305 (_ BitVec 32) List!7473) Bool)

(assert (=> b!429798 (= res!252452 (arrayNoDuplicates!0 lt!196444 #b00000000000000000000000000000000 Nil!7470))))

(declare-fun b!429799 () Bool)

(declare-fun res!252462 () Bool)

(assert (=> b!429799 (=> (not res!252462) (not e!254519))))

(assert (=> b!429799 (= res!252462 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18474 () Bool)

(assert (=> mapIsEmpty!18474 mapRes!18474))

(declare-fun b!429800 () Bool)

(declare-fun Unit!12636 () Unit!12633)

(assert (=> b!429800 (= e!254517 Unit!12636)))

(declare-fun lt!196436 () Unit!12633)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26305 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12633)

(assert (=> b!429800 (= lt!196436 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429800 false))

(declare-fun b!429801 () Bool)

(assert (=> b!429801 (= e!254518 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!12954 _keys!709))))))

(assert (=> b!429801 (not (= (select (arr!12602 _keys!709) from!863) k0!794))))

(declare-fun lt!196443 () Unit!12633)

(assert (=> b!429801 (= lt!196443 e!254517)))

(declare-fun c!55460 () Bool)

(assert (=> b!429801 (= c!55460 (= (select (arr!12602 _keys!709) from!863) k0!794))))

(declare-fun lt!196439 () ListLongMap!6369)

(declare-fun get!6251 (ValueCell!5274 V!16085) V!16085)

(declare-fun dynLambda!776 (Int (_ BitVec 64)) V!16085)

(assert (=> b!429801 (= lt!196439 (+!1349 lt!196442 (tuple2!7457 (select (arr!12602 _keys!709) from!863) (get!6251 (select (arr!12603 _values!549) from!863) (dynLambda!776 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!429802 () Bool)

(declare-fun res!252457 () Bool)

(assert (=> b!429802 (=> (not res!252457) (not e!254519))))

(assert (=> b!429802 (= res!252457 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7470))))

(declare-fun b!429803 () Bool)

(assert (=> b!429803 (= e!254515 e!254521)))

(declare-fun res!252458 () Bool)

(assert (=> b!429803 (=> (not res!252458) (not e!254521))))

(assert (=> b!429803 (= res!252458 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!429803 (= lt!196439 (getCurrentListMapNoExtraKeys!1402 lt!196444 lt!196438 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!429803 (= lt!196438 (array!26308 (store (arr!12603 _values!549) i!563 (ValueCellFull!5274 v!412)) (size!12955 _values!549)))))

(declare-fun lt!196441 () ListLongMap!6369)

(assert (=> b!429803 (= lt!196441 (getCurrentListMapNoExtraKeys!1402 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!252451 () Bool)

(assert (=> start!39816 (=> (not res!252451) (not e!254519))))

(assert (=> start!39816 (= res!252451 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12954 _keys!709))))))

(assert (=> start!39816 e!254519))

(assert (=> start!39816 tp_is_empty!11235))

(assert (=> start!39816 tp!35777))

(assert (=> start!39816 true))

(declare-fun array_inv!9178 (array!26307) Bool)

(assert (=> start!39816 (and (array_inv!9178 _values!549) e!254520)))

(declare-fun array_inv!9179 (array!26305) Bool)

(assert (=> start!39816 (array_inv!9179 _keys!709)))

(declare-fun mapNonEmpty!18474 () Bool)

(declare-fun tp!35778 () Bool)

(assert (=> mapNonEmpty!18474 (= mapRes!18474 (and tp!35778 e!254522))))

(declare-fun mapKey!18474 () (_ BitVec 32))

(declare-fun mapValue!18474 () ValueCell!5274)

(declare-fun mapRest!18474 () (Array (_ BitVec 32) ValueCell!5274))

(assert (=> mapNonEmpty!18474 (= (arr!12603 _values!549) (store mapRest!18474 mapKey!18474 mapValue!18474))))

(declare-fun b!429804 () Bool)

(declare-fun res!252459 () Bool)

(assert (=> b!429804 (=> (not res!252459) (not e!254519))))

(declare-fun arrayContainsKey!0 (array!26305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429804 (= res!252459 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!429805 () Bool)

(declare-fun res!252461 () Bool)

(assert (=> b!429805 (=> (not res!252461) (not e!254515))))

(assert (=> b!429805 (= res!252461 (bvsle from!863 i!563))))

(assert (= (and start!39816 res!252451) b!429793))

(assert (= (and b!429793 res!252455) b!429792))

(assert (= (and b!429792 res!252453) b!429797))

(assert (= (and b!429797 res!252454) b!429802))

(assert (= (and b!429802 res!252457) b!429790))

(assert (= (and b!429790 res!252450) b!429799))

(assert (= (and b!429799 res!252462) b!429787))

(assert (= (and b!429787 res!252460) b!429804))

(assert (= (and b!429804 res!252459) b!429794))

(assert (= (and b!429794 res!252449) b!429798))

(assert (= (and b!429798 res!252452) b!429805))

(assert (= (and b!429805 res!252461) b!429803))

(assert (= (and b!429803 res!252458) b!429791))

(assert (= (and b!429791 (not res!252456)) b!429801))

(assert (= (and b!429801 c!55460) b!429800))

(assert (= (and b!429801 (not c!55460)) b!429795))

(assert (= (and b!429788 condMapEmpty!18474) mapIsEmpty!18474))

(assert (= (and b!429788 (not condMapEmpty!18474)) mapNonEmpty!18474))

(get-info :version)

(assert (= (and mapNonEmpty!18474 ((_ is ValueCellFull!5274) mapValue!18474)) b!429796))

(assert (= (and b!429788 ((_ is ValueCellFull!5274) mapDefault!18474)) b!429789))

(assert (= start!39816 b!429788))

(declare-fun b_lambda!9171 () Bool)

(assert (=> (not b_lambda!9171) (not b!429801)))

(declare-fun t!13003 () Bool)

(declare-fun tb!3489 () Bool)

(assert (=> (and start!39816 (= defaultEntry!557 defaultEntry!557) t!13003) tb!3489))

(declare-fun result!6505 () Bool)

(assert (=> tb!3489 (= result!6505 tp_is_empty!11235)))

(assert (=> b!429801 t!13003))

(declare-fun b_and!17827 () Bool)

(assert (= b_and!17825 (and (=> t!13003 result!6505) b_and!17827)))

(declare-fun m!418057 () Bool)

(assert (=> start!39816 m!418057))

(declare-fun m!418059 () Bool)

(assert (=> start!39816 m!418059))

(declare-fun m!418061 () Bool)

(assert (=> b!429791 m!418061))

(declare-fun m!418063 () Bool)

(assert (=> b!429791 m!418063))

(declare-fun m!418065 () Bool)

(assert (=> b!429791 m!418065))

(declare-fun m!418067 () Bool)

(assert (=> b!429791 m!418067))

(assert (=> b!429791 m!418061))

(declare-fun m!418069 () Bool)

(assert (=> b!429791 m!418069))

(declare-fun m!418071 () Bool)

(assert (=> b!429791 m!418071))

(declare-fun m!418073 () Bool)

(assert (=> mapNonEmpty!18474 m!418073))

(declare-fun m!418075 () Bool)

(assert (=> b!429804 m!418075))

(declare-fun m!418077 () Bool)

(assert (=> b!429794 m!418077))

(declare-fun m!418079 () Bool)

(assert (=> b!429794 m!418079))

(assert (=> b!429801 m!418061))

(declare-fun m!418081 () Bool)

(assert (=> b!429801 m!418081))

(declare-fun m!418083 () Bool)

(assert (=> b!429801 m!418083))

(declare-fun m!418085 () Bool)

(assert (=> b!429801 m!418085))

(assert (=> b!429801 m!418083))

(assert (=> b!429801 m!418081))

(declare-fun m!418087 () Bool)

(assert (=> b!429801 m!418087))

(declare-fun m!418089 () Bool)

(assert (=> b!429787 m!418089))

(declare-fun m!418091 () Bool)

(assert (=> b!429798 m!418091))

(declare-fun m!418093 () Bool)

(assert (=> b!429797 m!418093))

(declare-fun m!418095 () Bool)

(assert (=> b!429799 m!418095))

(declare-fun m!418097 () Bool)

(assert (=> b!429802 m!418097))

(declare-fun m!418099 () Bool)

(assert (=> b!429793 m!418099))

(declare-fun m!418101 () Bool)

(assert (=> b!429800 m!418101))

(declare-fun m!418103 () Bool)

(assert (=> b!429803 m!418103))

(declare-fun m!418105 () Bool)

(assert (=> b!429803 m!418105))

(declare-fun m!418107 () Bool)

(assert (=> b!429803 m!418107))

(check-sat (not b!429803) (not b!429804) tp_is_empty!11235 (not b_lambda!9171) (not mapNonEmpty!18474) (not b!429799) (not b!429798) (not b!429793) (not b!429794) (not b!429791) (not b!429797) b_and!17827 (not b_next!10083) (not b!429801) (not start!39816) (not b!429800) (not b!429802))
(check-sat b_and!17827 (not b_next!10083))
