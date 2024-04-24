; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38558 () Bool)

(assert start!38558)

(declare-fun b_free!9109 () Bool)

(declare-fun b_next!9109 () Bool)

(assert (=> start!38558 (= b_free!9109 (not b_next!9109))))

(declare-fun tp!32450 () Bool)

(declare-fun b_and!16509 () Bool)

(assert (=> start!38558 (= tp!32450 b_and!16509)))

(declare-fun b!399189 () Bool)

(declare-fun e!241120 () Bool)

(declare-fun tp_is_empty!9991 () Bool)

(assert (=> b!399189 (= e!241120 tp_is_empty!9991)))

(declare-fun b!399190 () Bool)

(declare-fun res!229531 () Bool)

(declare-fun e!241115 () Bool)

(assert (=> b!399190 (=> (not res!229531) (not e!241115))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399190 (= res!229531 (validMask!0 mask!1025))))

(declare-fun b!399191 () Bool)

(declare-fun res!229542 () Bool)

(assert (=> b!399191 (=> (not res!229542) (not e!241115))))

(declare-datatypes ((array!23872 0))(
  ( (array!23873 (arr!11385 (Array (_ BitVec 32) (_ BitVec 64))) (size!11737 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23872)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23872 (_ BitVec 32)) Bool)

(assert (=> b!399191 (= res!229542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!399192 () Bool)

(declare-fun res!229541 () Bool)

(assert (=> b!399192 (=> (not res!229541) (not e!241115))))

(declare-datatypes ((List!6457 0))(
  ( (Nil!6454) (Cons!6453 (h!7309 (_ BitVec 64)) (t!11623 List!6457)) )
))
(declare-fun arrayNoDuplicates!0 (array!23872 (_ BitVec 32) List!6457) Bool)

(assert (=> b!399192 (= res!229541 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6454))))

(declare-fun mapIsEmpty!16608 () Bool)

(declare-fun mapRes!16608 () Bool)

(assert (=> mapIsEmpty!16608 mapRes!16608))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!27975 () Bool)

(declare-fun lt!187571 () array!23872)

(declare-datatypes ((V!14427 0))(
  ( (V!14428 (val!5040 Int)) )
))
(declare-datatypes ((ValueCell!4652 0))(
  ( (ValueCellFull!4652 (v!7288 V!14427)) (EmptyCell!4652) )
))
(declare-datatypes ((array!23874 0))(
  ( (array!23875 (arr!11386 (Array (_ BitVec 32) ValueCell!4652)) (size!11738 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23874)

(declare-fun zeroValue!515 () V!14427)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun c!54597 () Bool)

(declare-fun v!412 () V!14427)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!14427)

(declare-datatypes ((tuple2!6538 0))(
  ( (tuple2!6539 (_1!3280 (_ BitVec 64)) (_2!3280 V!14427)) )
))
(declare-datatypes ((List!6458 0))(
  ( (Nil!6455) (Cons!6454 (h!7310 tuple2!6538) (t!11624 List!6458)) )
))
(declare-datatypes ((ListLongMap!5453 0))(
  ( (ListLongMap!5454 (toList!2742 List!6458)) )
))
(declare-fun call!27979 () ListLongMap!5453)

(declare-fun getCurrentListMapNoExtraKeys!1001 (array!23872 array!23874 (_ BitVec 32) (_ BitVec 32) V!14427 V!14427 (_ BitVec 32) Int) ListLongMap!5453)

(assert (=> bm!27975 (= call!27979 (getCurrentListMapNoExtraKeys!1001 (ite c!54597 _keys!709 lt!187571) (ite c!54597 _values!549 (array!23875 (store (arr!11386 _values!549) i!563 (ValueCellFull!4652 v!412)) (size!11738 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399193 () Bool)

(declare-fun e!241118 () Bool)

(declare-fun call!27978 () ListLongMap!5453)

(assert (=> b!399193 (= e!241118 (= call!27979 call!27978))))

(declare-fun b!399194 () Bool)

(declare-fun res!229536 () Bool)

(assert (=> b!399194 (=> (not res!229536) (not e!241115))))

(assert (=> b!399194 (= res!229536 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11737 _keys!709))))))

(declare-fun b!399195 () Bool)

(declare-fun e!241117 () Bool)

(assert (=> b!399195 (= e!241117 (and e!241120 mapRes!16608))))

(declare-fun condMapEmpty!16608 () Bool)

(declare-fun mapDefault!16608 () ValueCell!4652)

(assert (=> b!399195 (= condMapEmpty!16608 (= (arr!11386 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4652)) mapDefault!16608)))))

(declare-fun bm!27976 () Bool)

(assert (=> bm!27976 (= call!27978 (getCurrentListMapNoExtraKeys!1001 (ite c!54597 lt!187571 _keys!709) (ite c!54597 (array!23875 (store (arr!11386 _values!549) i!563 (ValueCellFull!4652 v!412)) (size!11738 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16608 () Bool)

(declare-fun tp!32451 () Bool)

(declare-fun e!241114 () Bool)

(assert (=> mapNonEmpty!16608 (= mapRes!16608 (and tp!32451 e!241114))))

(declare-fun mapKey!16608 () (_ BitVec 32))

(declare-fun mapRest!16608 () (Array (_ BitVec 32) ValueCell!4652))

(declare-fun mapValue!16608 () ValueCell!4652)

(assert (=> mapNonEmpty!16608 (= (arr!11386 _values!549) (store mapRest!16608 mapKey!16608 mapValue!16608))))

(declare-fun b!399196 () Bool)

(assert (=> b!399196 (= e!241114 tp_is_empty!9991)))

(declare-fun b!399197 () Bool)

(declare-fun res!229539 () Bool)

(assert (=> b!399197 (=> (not res!229539) (not e!241115))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399197 (= res!229539 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399198 () Bool)

(declare-fun res!229540 () Bool)

(assert (=> b!399198 (=> (not res!229540) (not e!241115))))

(assert (=> b!399198 (= res!229540 (and (= (size!11738 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11737 _keys!709) (size!11738 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!229538 () Bool)

(assert (=> start!38558 (=> (not res!229538) (not e!241115))))

(assert (=> start!38558 (= res!229538 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11737 _keys!709))))))

(assert (=> start!38558 e!241115))

(assert (=> start!38558 tp_is_empty!9991))

(assert (=> start!38558 tp!32450))

(assert (=> start!38558 true))

(declare-fun array_inv!8408 (array!23874) Bool)

(assert (=> start!38558 (and (array_inv!8408 _values!549) e!241117)))

(declare-fun array_inv!8409 (array!23872) Bool)

(assert (=> start!38558 (array_inv!8409 _keys!709)))

(declare-fun b!399199 () Bool)

(declare-fun res!229533 () Bool)

(assert (=> b!399199 (=> (not res!229533) (not e!241115))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399199 (= res!229533 (validKeyInArray!0 k0!794))))

(declare-fun b!399200 () Bool)

(declare-fun res!229534 () Bool)

(declare-fun e!241116 () Bool)

(assert (=> b!399200 (=> (not res!229534) (not e!241116))))

(assert (=> b!399200 (= res!229534 (arrayNoDuplicates!0 lt!187571 #b00000000000000000000000000000000 Nil!6454))))

(declare-fun b!399201 () Bool)

(assert (=> b!399201 (= e!241116 (not true))))

(assert (=> b!399201 e!241118))

(assert (=> b!399201 (= c!54597 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12071 0))(
  ( (Unit!12072) )
))
(declare-fun lt!187572 () Unit!12071)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!303 (array!23872 array!23874 (_ BitVec 32) (_ BitVec 32) V!14427 V!14427 (_ BitVec 32) (_ BitVec 64) V!14427 (_ BitVec 32) Int) Unit!12071)

(assert (=> b!399201 (= lt!187572 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!303 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399202 () Bool)

(declare-fun res!229535 () Bool)

(assert (=> b!399202 (=> (not res!229535) (not e!241116))))

(assert (=> b!399202 (= res!229535 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11737 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399203 () Bool)

(declare-fun +!1092 (ListLongMap!5453 tuple2!6538) ListLongMap!5453)

(assert (=> b!399203 (= e!241118 (= call!27978 (+!1092 call!27979 (tuple2!6539 k0!794 v!412))))))

(declare-fun b!399204 () Bool)

(declare-fun res!229537 () Bool)

(assert (=> b!399204 (=> (not res!229537) (not e!241115))))

(assert (=> b!399204 (= res!229537 (or (= (select (arr!11385 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11385 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399205 () Bool)

(assert (=> b!399205 (= e!241115 e!241116)))

(declare-fun res!229532 () Bool)

(assert (=> b!399205 (=> (not res!229532) (not e!241116))))

(assert (=> b!399205 (= res!229532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187571 mask!1025))))

(assert (=> b!399205 (= lt!187571 (array!23873 (store (arr!11385 _keys!709) i!563 k0!794) (size!11737 _keys!709)))))

(assert (= (and start!38558 res!229538) b!399190))

(assert (= (and b!399190 res!229531) b!399198))

(assert (= (and b!399198 res!229540) b!399191))

(assert (= (and b!399191 res!229542) b!399192))

(assert (= (and b!399192 res!229541) b!399194))

(assert (= (and b!399194 res!229536) b!399199))

(assert (= (and b!399199 res!229533) b!399204))

(assert (= (and b!399204 res!229537) b!399197))

(assert (= (and b!399197 res!229539) b!399205))

(assert (= (and b!399205 res!229532) b!399200))

(assert (= (and b!399200 res!229534) b!399202))

(assert (= (and b!399202 res!229535) b!399201))

(assert (= (and b!399201 c!54597) b!399203))

(assert (= (and b!399201 (not c!54597)) b!399193))

(assert (= (or b!399203 b!399193) bm!27976))

(assert (= (or b!399203 b!399193) bm!27975))

(assert (= (and b!399195 condMapEmpty!16608) mapIsEmpty!16608))

(assert (= (and b!399195 (not condMapEmpty!16608)) mapNonEmpty!16608))

(get-info :version)

(assert (= (and mapNonEmpty!16608 ((_ is ValueCellFull!4652) mapValue!16608)) b!399196))

(assert (= (and b!399195 ((_ is ValueCellFull!4652) mapDefault!16608)) b!399189))

(assert (= start!38558 b!399195))

(declare-fun m!394059 () Bool)

(assert (=> b!399190 m!394059))

(declare-fun m!394061 () Bool)

(assert (=> b!399204 m!394061))

(declare-fun m!394063 () Bool)

(assert (=> b!399192 m!394063))

(declare-fun m!394065 () Bool)

(assert (=> mapNonEmpty!16608 m!394065))

(declare-fun m!394067 () Bool)

(assert (=> start!38558 m!394067))

(declare-fun m!394069 () Bool)

(assert (=> start!38558 m!394069))

(declare-fun m!394071 () Bool)

(assert (=> b!399197 m!394071))

(declare-fun m!394073 () Bool)

(assert (=> b!399191 m!394073))

(declare-fun m!394075 () Bool)

(assert (=> b!399203 m!394075))

(declare-fun m!394077 () Bool)

(assert (=> b!399205 m!394077))

(declare-fun m!394079 () Bool)

(assert (=> b!399205 m!394079))

(declare-fun m!394081 () Bool)

(assert (=> bm!27976 m!394081))

(declare-fun m!394083 () Bool)

(assert (=> bm!27976 m!394083))

(assert (=> bm!27975 m!394081))

(declare-fun m!394085 () Bool)

(assert (=> bm!27975 m!394085))

(declare-fun m!394087 () Bool)

(assert (=> b!399199 m!394087))

(declare-fun m!394089 () Bool)

(assert (=> b!399201 m!394089))

(declare-fun m!394091 () Bool)

(assert (=> b!399200 m!394091))

(check-sat (not bm!27975) (not b!399199) (not start!38558) (not b!399201) (not b!399192) tp_is_empty!9991 b_and!16509 (not b!399191) (not b!399203) (not b!399205) (not b_next!9109) (not bm!27976) (not b!399200) (not b!399190) (not mapNonEmpty!16608) (not b!399197))
(check-sat b_and!16509 (not b_next!9109))
