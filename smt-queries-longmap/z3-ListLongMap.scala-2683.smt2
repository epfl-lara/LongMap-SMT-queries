; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39902 () Bool)

(assert start!39902)

(declare-fun b_free!10183 () Bool)

(declare-fun b_next!10183 () Bool)

(assert (=> start!39902 (= b_free!10183 (not b_next!10183))))

(declare-fun tp!36078 () Bool)

(declare-fun b_and!17999 () Bool)

(assert (=> start!39902 (= tp!36078 b_and!17999)))

(declare-fun b!432603 () Bool)

(declare-datatypes ((Unit!12773 0))(
  ( (Unit!12774) )
))
(declare-fun e!255832 () Unit!12773)

(declare-fun Unit!12775 () Unit!12773)

(assert (=> b!432603 (= e!255832 Unit!12775)))

(declare-fun b!432604 () Bool)

(declare-fun res!254560 () Bool)

(declare-fun e!255835 () Bool)

(assert (=> b!432604 (=> (not res!254560) (not e!255835))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432604 (= res!254560 (validKeyInArray!0 k0!794))))

(declare-fun b!432605 () Bool)

(declare-fun Unit!12776 () Unit!12773)

(assert (=> b!432605 (= e!255832 Unit!12776)))

(declare-fun lt!198387 () Unit!12773)

(declare-datatypes ((array!26497 0))(
  ( (array!26498 (arr!12698 (Array (_ BitVec 32) (_ BitVec 64))) (size!13051 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26497)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26497 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12773)

(assert (=> b!432605 (= lt!198387 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432605 false))

(declare-fun b!432607 () Bool)

(declare-fun res!254558 () Bool)

(assert (=> b!432607 (=> (not res!254558) (not e!255835))))

(declare-fun arrayContainsKey!0 (array!26497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432607 (= res!254558 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!432608 () Bool)

(declare-fun res!254567 () Bool)

(declare-fun e!255837 () Bool)

(assert (=> b!432608 (=> (not res!254567) (not e!255837))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432608 (= res!254567 (bvsle from!863 i!563))))

(declare-fun b!432609 () Bool)

(declare-fun res!254557 () Bool)

(assert (=> b!432609 (=> (not res!254557) (not e!255835))))

(declare-datatypes ((List!7547 0))(
  ( (Nil!7544) (Cons!7543 (h!8399 (_ BitVec 64)) (t!13170 List!7547)) )
))
(declare-fun arrayNoDuplicates!0 (array!26497 (_ BitVec 32) List!7547) Bool)

(assert (=> b!432609 (= res!254557 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7544))))

(declare-fun b!432610 () Bool)

(declare-fun e!255829 () Bool)

(assert (=> b!432610 (= e!255829 true)))

(declare-datatypes ((V!16219 0))(
  ( (V!16220 (val!5712 Int)) )
))
(declare-datatypes ((tuple2!7554 0))(
  ( (tuple2!7555 (_1!3788 (_ BitVec 64)) (_2!3788 V!16219)) )
))
(declare-fun lt!198394 () tuple2!7554)

(declare-datatypes ((List!7548 0))(
  ( (Nil!7545) (Cons!7544 (h!8400 tuple2!7554) (t!13171 List!7548)) )
))
(declare-datatypes ((ListLongMap!6457 0))(
  ( (ListLongMap!6458 (toList!3244 List!7548)) )
))
(declare-fun lt!198397 () ListLongMap!6457)

(declare-fun lt!198388 () tuple2!7554)

(declare-fun lt!198391 () ListLongMap!6457)

(declare-fun +!1419 (ListLongMap!6457 tuple2!7554) ListLongMap!6457)

(assert (=> b!432610 (= lt!198397 (+!1419 (+!1419 lt!198391 lt!198388) lt!198394))))

(declare-fun lt!198396 () V!16219)

(declare-fun lt!198399 () Unit!12773)

(declare-fun v!412 () V!16219)

(declare-fun addCommutativeForDiffKeys!378 (ListLongMap!6457 (_ BitVec 64) V!16219 (_ BitVec 64) V!16219) Unit!12773)

(assert (=> b!432610 (= lt!198399 (addCommutativeForDiffKeys!378 lt!198391 k0!794 v!412 (select (arr!12698 _keys!709) from!863) lt!198396))))

(declare-fun b!432611 () Bool)

(declare-fun e!255833 () Bool)

(declare-fun tp_is_empty!11335 () Bool)

(assert (=> b!432611 (= e!255833 tp_is_empty!11335)))

(declare-fun b!432612 () Bool)

(declare-fun e!255831 () Bool)

(declare-fun mapRes!18624 () Bool)

(assert (=> b!432612 (= e!255831 (and e!255833 mapRes!18624))))

(declare-fun condMapEmpty!18624 () Bool)

(declare-datatypes ((ValueCell!5324 0))(
  ( (ValueCellFull!5324 (v!7953 V!16219)) (EmptyCell!5324) )
))
(declare-datatypes ((array!26499 0))(
  ( (array!26500 (arr!12699 (Array (_ BitVec 32) ValueCell!5324)) (size!13052 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26499)

(declare-fun mapDefault!18624 () ValueCell!5324)

(assert (=> b!432612 (= condMapEmpty!18624 (= (arr!12699 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5324)) mapDefault!18624)))))

(declare-fun b!432613 () Bool)

(declare-fun res!254566 () Bool)

(assert (=> b!432613 (=> (not res!254566) (not e!255835))))

(assert (=> b!432613 (= res!254566 (or (= (select (arr!12698 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12698 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432614 () Bool)

(assert (=> b!432614 (= e!255835 e!255837)))

(declare-fun res!254562 () Bool)

(assert (=> b!432614 (=> (not res!254562) (not e!255837))))

(declare-fun lt!198389 () array!26497)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26497 (_ BitVec 32)) Bool)

(assert (=> b!432614 (= res!254562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198389 mask!1025))))

(assert (=> b!432614 (= lt!198389 (array!26498 (store (arr!12698 _keys!709) i!563 k0!794) (size!13051 _keys!709)))))

(declare-fun mapIsEmpty!18624 () Bool)

(assert (=> mapIsEmpty!18624 mapRes!18624))

(declare-fun b!432615 () Bool)

(declare-fun res!254561 () Bool)

(assert (=> b!432615 (=> (not res!254561) (not e!255835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432615 (= res!254561 (validMask!0 mask!1025))))

(declare-fun b!432616 () Bool)

(declare-fun e!255836 () Bool)

(declare-fun e!255830 () Bool)

(assert (=> b!432616 (= e!255836 (not e!255830))))

(declare-fun res!254569 () Bool)

(assert (=> b!432616 (=> res!254569 e!255830)))

(assert (=> b!432616 (= res!254569 (not (validKeyInArray!0 (select (arr!12698 _keys!709) from!863))))))

(declare-fun lt!198400 () ListLongMap!6457)

(declare-fun lt!198395 () ListLongMap!6457)

(assert (=> b!432616 (= lt!198400 lt!198395)))

(assert (=> b!432616 (= lt!198395 (+!1419 lt!198391 lt!198394))))

(declare-fun lt!198393 () array!26499)

(declare-fun minValue!515 () V!16219)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16219)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1447 (array!26497 array!26499 (_ BitVec 32) (_ BitVec 32) V!16219 V!16219 (_ BitVec 32) Int) ListLongMap!6457)

(assert (=> b!432616 (= lt!198400 (getCurrentListMapNoExtraKeys!1447 lt!198389 lt!198393 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!432616 (= lt!198394 (tuple2!7555 k0!794 v!412))))

(assert (=> b!432616 (= lt!198391 (getCurrentListMapNoExtraKeys!1447 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198398 () Unit!12773)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!572 (array!26497 array!26499 (_ BitVec 32) (_ BitVec 32) V!16219 V!16219 (_ BitVec 32) (_ BitVec 64) V!16219 (_ BitVec 32) Int) Unit!12773)

(assert (=> b!432616 (= lt!198398 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!572 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432617 () Bool)

(declare-fun e!255828 () Bool)

(assert (=> b!432617 (= e!255828 tp_is_empty!11335)))

(declare-fun res!254571 () Bool)

(assert (=> start!39902 (=> (not res!254571) (not e!255835))))

(assert (=> start!39902 (= res!254571 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13051 _keys!709))))))

(assert (=> start!39902 e!255835))

(assert (=> start!39902 tp_is_empty!11335))

(assert (=> start!39902 tp!36078))

(assert (=> start!39902 true))

(declare-fun array_inv!9274 (array!26499) Bool)

(assert (=> start!39902 (and (array_inv!9274 _values!549) e!255831)))

(declare-fun array_inv!9275 (array!26497) Bool)

(assert (=> start!39902 (array_inv!9275 _keys!709)))

(declare-fun b!432606 () Bool)

(declare-fun res!254570 () Bool)

(assert (=> b!432606 (=> (not res!254570) (not e!255835))))

(assert (=> b!432606 (= res!254570 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13051 _keys!709))))))

(declare-fun mapNonEmpty!18624 () Bool)

(declare-fun tp!36077 () Bool)

(assert (=> mapNonEmpty!18624 (= mapRes!18624 (and tp!36077 e!255828))))

(declare-fun mapKey!18624 () (_ BitVec 32))

(declare-fun mapValue!18624 () ValueCell!5324)

(declare-fun mapRest!18624 () (Array (_ BitVec 32) ValueCell!5324))

(assert (=> mapNonEmpty!18624 (= (arr!12699 _values!549) (store mapRest!18624 mapKey!18624 mapValue!18624))))

(declare-fun b!432618 () Bool)

(assert (=> b!432618 (= e!255837 e!255836)))

(declare-fun res!254568 () Bool)

(assert (=> b!432618 (=> (not res!254568) (not e!255836))))

(assert (=> b!432618 (= res!254568 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!198390 () ListLongMap!6457)

(assert (=> b!432618 (= lt!198390 (getCurrentListMapNoExtraKeys!1447 lt!198389 lt!198393 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432618 (= lt!198393 (array!26500 (store (arr!12699 _values!549) i!563 (ValueCellFull!5324 v!412)) (size!13052 _values!549)))))

(declare-fun lt!198401 () ListLongMap!6457)

(assert (=> b!432618 (= lt!198401 (getCurrentListMapNoExtraKeys!1447 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432619 () Bool)

(assert (=> b!432619 (= e!255830 e!255829)))

(declare-fun res!254563 () Bool)

(assert (=> b!432619 (=> res!254563 e!255829)))

(assert (=> b!432619 (= res!254563 (= k0!794 (select (arr!12698 _keys!709) from!863)))))

(assert (=> b!432619 (not (= (select (arr!12698 _keys!709) from!863) k0!794))))

(declare-fun lt!198392 () Unit!12773)

(assert (=> b!432619 (= lt!198392 e!255832)))

(declare-fun c!55539 () Bool)

(assert (=> b!432619 (= c!55539 (= (select (arr!12698 _keys!709) from!863) k0!794))))

(assert (=> b!432619 (= lt!198390 lt!198397)))

(assert (=> b!432619 (= lt!198397 (+!1419 lt!198395 lt!198388))))

(assert (=> b!432619 (= lt!198388 (tuple2!7555 (select (arr!12698 _keys!709) from!863) lt!198396))))

(declare-fun get!6317 (ValueCell!5324 V!16219) V!16219)

(declare-fun dynLambda!805 (Int (_ BitVec 64)) V!16219)

(assert (=> b!432619 (= lt!198396 (get!6317 (select (arr!12699 _values!549) from!863) (dynLambda!805 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432620 () Bool)

(declare-fun res!254559 () Bool)

(assert (=> b!432620 (=> (not res!254559) (not e!255837))))

(assert (=> b!432620 (= res!254559 (arrayNoDuplicates!0 lt!198389 #b00000000000000000000000000000000 Nil!7544))))

(declare-fun b!432621 () Bool)

(declare-fun res!254564 () Bool)

(assert (=> b!432621 (=> (not res!254564) (not e!255835))))

(assert (=> b!432621 (= res!254564 (and (= (size!13052 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13051 _keys!709) (size!13052 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432622 () Bool)

(declare-fun res!254565 () Bool)

(assert (=> b!432622 (=> (not res!254565) (not e!255835))))

(assert (=> b!432622 (= res!254565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39902 res!254571) b!432615))

(assert (= (and b!432615 res!254561) b!432621))

(assert (= (and b!432621 res!254564) b!432622))

(assert (= (and b!432622 res!254565) b!432609))

(assert (= (and b!432609 res!254557) b!432606))

(assert (= (and b!432606 res!254570) b!432604))

(assert (= (and b!432604 res!254560) b!432613))

(assert (= (and b!432613 res!254566) b!432607))

(assert (= (and b!432607 res!254558) b!432614))

(assert (= (and b!432614 res!254562) b!432620))

(assert (= (and b!432620 res!254559) b!432608))

(assert (= (and b!432608 res!254567) b!432618))

(assert (= (and b!432618 res!254568) b!432616))

(assert (= (and b!432616 (not res!254569)) b!432619))

(assert (= (and b!432619 c!55539) b!432605))

(assert (= (and b!432619 (not c!55539)) b!432603))

(assert (= (and b!432619 (not res!254563)) b!432610))

(assert (= (and b!432612 condMapEmpty!18624) mapIsEmpty!18624))

(assert (= (and b!432612 (not condMapEmpty!18624)) mapNonEmpty!18624))

(get-info :version)

(assert (= (and mapNonEmpty!18624 ((_ is ValueCellFull!5324) mapValue!18624)) b!432617))

(assert (= (and b!432612 ((_ is ValueCellFull!5324) mapDefault!18624)) b!432611))

(assert (= start!39902 b!432612))

(declare-fun b_lambda!9253 () Bool)

(assert (=> (not b_lambda!9253) (not b!432619)))

(declare-fun t!13169 () Bool)

(declare-fun tb!3581 () Bool)

(assert (=> (and start!39902 (= defaultEntry!557 defaultEntry!557) t!13169) tb!3581))

(declare-fun result!6697 () Bool)

(assert (=> tb!3581 (= result!6697 tp_is_empty!11335)))

(assert (=> b!432619 t!13169))

(declare-fun b_and!18001 () Bool)

(assert (= b_and!17999 (and (=> t!13169 result!6697) b_and!18001)))

(declare-fun m!420195 () Bool)

(assert (=> b!432607 m!420195))

(declare-fun m!420197 () Bool)

(assert (=> b!432619 m!420197))

(declare-fun m!420199 () Bool)

(assert (=> b!432619 m!420199))

(declare-fun m!420201 () Bool)

(assert (=> b!432619 m!420201))

(declare-fun m!420203 () Bool)

(assert (=> b!432619 m!420203))

(assert (=> b!432619 m!420203))

(assert (=> b!432619 m!420199))

(declare-fun m!420205 () Bool)

(assert (=> b!432619 m!420205))

(declare-fun m!420207 () Bool)

(assert (=> b!432610 m!420207))

(assert (=> b!432610 m!420207))

(declare-fun m!420209 () Bool)

(assert (=> b!432610 m!420209))

(assert (=> b!432610 m!420197))

(assert (=> b!432610 m!420197))

(declare-fun m!420211 () Bool)

(assert (=> b!432610 m!420211))

(declare-fun m!420213 () Bool)

(assert (=> b!432605 m!420213))

(declare-fun m!420215 () Bool)

(assert (=> b!432618 m!420215))

(declare-fun m!420217 () Bool)

(assert (=> b!432618 m!420217))

(declare-fun m!420219 () Bool)

(assert (=> b!432618 m!420219))

(declare-fun m!420221 () Bool)

(assert (=> b!432622 m!420221))

(declare-fun m!420223 () Bool)

(assert (=> b!432615 m!420223))

(declare-fun m!420225 () Bool)

(assert (=> b!432609 m!420225))

(assert (=> b!432616 m!420197))

(declare-fun m!420227 () Bool)

(assert (=> b!432616 m!420227))

(declare-fun m!420229 () Bool)

(assert (=> b!432616 m!420229))

(assert (=> b!432616 m!420197))

(declare-fun m!420231 () Bool)

(assert (=> b!432616 m!420231))

(declare-fun m!420233 () Bool)

(assert (=> b!432616 m!420233))

(declare-fun m!420235 () Bool)

(assert (=> b!432616 m!420235))

(declare-fun m!420237 () Bool)

(assert (=> b!432604 m!420237))

(declare-fun m!420239 () Bool)

(assert (=> b!432620 m!420239))

(declare-fun m!420241 () Bool)

(assert (=> mapNonEmpty!18624 m!420241))

(declare-fun m!420243 () Bool)

(assert (=> start!39902 m!420243))

(declare-fun m!420245 () Bool)

(assert (=> start!39902 m!420245))

(declare-fun m!420247 () Bool)

(assert (=> b!432614 m!420247))

(declare-fun m!420249 () Bool)

(assert (=> b!432614 m!420249))

(declare-fun m!420251 () Bool)

(assert (=> b!432613 m!420251))

(check-sat (not b!432604) tp_is_empty!11335 (not b!432614) (not b!432619) (not b!432607) (not b!432622) b_and!18001 (not b!432610) (not start!39902) (not b!432609) (not b!432605) (not b!432616) (not b!432615) (not b!432620) (not b_lambda!9253) (not b_next!10183) (not b!432618) (not mapNonEmpty!18624))
(check-sat b_and!18001 (not b_next!10183))
