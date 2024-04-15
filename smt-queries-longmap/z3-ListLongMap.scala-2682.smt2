; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39896 () Bool)

(assert start!39896)

(declare-fun b_free!10177 () Bool)

(declare-fun b_next!10177 () Bool)

(assert (=> start!39896 (= b_free!10177 (not b_next!10177))))

(declare-fun tp!36059 () Bool)

(declare-fun b_and!17987 () Bool)

(assert (=> start!39896 (= tp!36059 b_and!17987)))

(declare-fun b!432417 () Bool)

(declare-fun e!255738 () Bool)

(declare-fun tp_is_empty!11329 () Bool)

(assert (=> b!432417 (= e!255738 tp_is_empty!11329)))

(declare-fun b!432418 () Bool)

(declare-datatypes ((Unit!12764 0))(
  ( (Unit!12765) )
))
(declare-fun e!255741 () Unit!12764)

(declare-fun Unit!12766 () Unit!12764)

(assert (=> b!432418 (= e!255741 Unit!12766)))

(declare-fun b!432419 () Bool)

(declare-fun e!255746 () Bool)

(declare-fun e!255744 () Bool)

(assert (=> b!432419 (= e!255746 e!255744)))

(declare-fun res!254422 () Bool)

(assert (=> b!432419 (=> (not res!254422) (not e!255744))))

(declare-datatypes ((array!26485 0))(
  ( (array!26486 (arr!12692 (Array (_ BitVec 32) (_ BitVec 64))) (size!13045 (_ BitVec 32))) )
))
(declare-fun lt!198261 () array!26485)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26485 (_ BitVec 32)) Bool)

(assert (=> b!432419 (= res!254422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198261 mask!1025))))

(declare-fun _keys!709 () array!26485)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432419 (= lt!198261 (array!26486 (store (arr!12692 _keys!709) i!563 k0!794) (size!13045 _keys!709)))))

(declare-fun mapIsEmpty!18615 () Bool)

(declare-fun mapRes!18615 () Bool)

(assert (=> mapIsEmpty!18615 mapRes!18615))

(declare-fun b!432421 () Bool)

(declare-fun res!254435 () Bool)

(assert (=> b!432421 (=> (not res!254435) (not e!255744))))

(declare-datatypes ((List!7542 0))(
  ( (Nil!7539) (Cons!7538 (h!8394 (_ BitVec 64)) (t!13159 List!7542)) )
))
(declare-fun arrayNoDuplicates!0 (array!26485 (_ BitVec 32) List!7542) Bool)

(assert (=> b!432421 (= res!254435 (arrayNoDuplicates!0 lt!198261 #b00000000000000000000000000000000 Nil!7539))))

(declare-fun b!432422 () Bool)

(declare-fun res!254427 () Bool)

(assert (=> b!432422 (=> (not res!254427) (not e!255746))))

(assert (=> b!432422 (= res!254427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432423 () Bool)

(declare-fun e!255740 () Bool)

(assert (=> b!432423 (= e!255740 true)))

(declare-datatypes ((V!16211 0))(
  ( (V!16212 (val!5709 Int)) )
))
(declare-datatypes ((tuple2!7548 0))(
  ( (tuple2!7549 (_1!3785 (_ BitVec 64)) (_2!3785 V!16211)) )
))
(declare-fun lt!198256 () tuple2!7548)

(declare-datatypes ((List!7543 0))(
  ( (Nil!7540) (Cons!7539 (h!8395 tuple2!7548) (t!13160 List!7543)) )
))
(declare-datatypes ((ListLongMap!6451 0))(
  ( (ListLongMap!6452 (toList!3241 List!7543)) )
))
(declare-fun lt!198263 () ListLongMap!6451)

(declare-fun lt!198259 () tuple2!7548)

(declare-fun lt!198264 () ListLongMap!6451)

(declare-fun +!1416 (ListLongMap!6451 tuple2!7548) ListLongMap!6451)

(assert (=> b!432423 (= lt!198263 (+!1416 (+!1416 lt!198264 lt!198256) lt!198259))))

(declare-fun lt!198257 () Unit!12764)

(declare-fun lt!198254 () V!16211)

(declare-fun v!412 () V!16211)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!375 (ListLongMap!6451 (_ BitVec 64) V!16211 (_ BitVec 64) V!16211) Unit!12764)

(assert (=> b!432423 (= lt!198257 (addCommutativeForDiffKeys!375 lt!198264 k0!794 v!412 (select (arr!12692 _keys!709) from!863) lt!198254))))

(declare-fun b!432424 () Bool)

(declare-fun e!255745 () Bool)

(assert (=> b!432424 (= e!255745 tp_is_empty!11329)))

(declare-fun b!432425 () Bool)

(declare-fun e!255739 () Bool)

(assert (=> b!432425 (= e!255739 (and e!255738 mapRes!18615))))

(declare-fun condMapEmpty!18615 () Bool)

(declare-datatypes ((ValueCell!5321 0))(
  ( (ValueCellFull!5321 (v!7950 V!16211)) (EmptyCell!5321) )
))
(declare-datatypes ((array!26487 0))(
  ( (array!26488 (arr!12693 (Array (_ BitVec 32) ValueCell!5321)) (size!13046 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26487)

(declare-fun mapDefault!18615 () ValueCell!5321)

(assert (=> b!432425 (= condMapEmpty!18615 (= (arr!12693 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5321)) mapDefault!18615)))))

(declare-fun b!432426 () Bool)

(declare-fun e!255742 () Bool)

(assert (=> b!432426 (= e!255744 e!255742)))

(declare-fun res!254433 () Bool)

(assert (=> b!432426 (=> (not res!254433) (not e!255742))))

(assert (=> b!432426 (= res!254433 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16211)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!198260 () array!26487)

(declare-fun lt!198265 () ListLongMap!6451)

(declare-fun zeroValue!515 () V!16211)

(declare-fun getCurrentListMapNoExtraKeys!1445 (array!26485 array!26487 (_ BitVec 32) (_ BitVec 32) V!16211 V!16211 (_ BitVec 32) Int) ListLongMap!6451)

(assert (=> b!432426 (= lt!198265 (getCurrentListMapNoExtraKeys!1445 lt!198261 lt!198260 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432426 (= lt!198260 (array!26488 (store (arr!12693 _values!549) i!563 (ValueCellFull!5321 v!412)) (size!13046 _values!549)))))

(declare-fun lt!198262 () ListLongMap!6451)

(assert (=> b!432426 (= lt!198262 (getCurrentListMapNoExtraKeys!1445 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432427 () Bool)

(declare-fun res!254436 () Bool)

(assert (=> b!432427 (=> (not res!254436) (not e!255746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432427 (= res!254436 (validMask!0 mask!1025))))

(declare-fun b!432428 () Bool)

(declare-fun res!254423 () Bool)

(assert (=> b!432428 (=> (not res!254423) (not e!255746))))

(assert (=> b!432428 (= res!254423 (or (= (select (arr!12692 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12692 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432429 () Bool)

(declare-fun res!254434 () Bool)

(assert (=> b!432429 (=> (not res!254434) (not e!255746))))

(assert (=> b!432429 (= res!254434 (and (= (size!13046 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13045 _keys!709) (size!13046 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!254428 () Bool)

(assert (=> start!39896 (=> (not res!254428) (not e!255746))))

(assert (=> start!39896 (= res!254428 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13045 _keys!709))))))

(assert (=> start!39896 e!255746))

(assert (=> start!39896 tp_is_empty!11329))

(assert (=> start!39896 tp!36059))

(assert (=> start!39896 true))

(declare-fun array_inv!9270 (array!26487) Bool)

(assert (=> start!39896 (and (array_inv!9270 _values!549) e!255739)))

(declare-fun array_inv!9271 (array!26485) Bool)

(assert (=> start!39896 (array_inv!9271 _keys!709)))

(declare-fun b!432420 () Bool)

(declare-fun res!254430 () Bool)

(assert (=> b!432420 (=> (not res!254430) (not e!255746))))

(assert (=> b!432420 (= res!254430 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13045 _keys!709))))))

(declare-fun b!432430 () Bool)

(declare-fun e!255747 () Bool)

(assert (=> b!432430 (= e!255747 e!255740)))

(declare-fun res!254429 () Bool)

(assert (=> b!432430 (=> res!254429 e!255740)))

(assert (=> b!432430 (= res!254429 (= k0!794 (select (arr!12692 _keys!709) from!863)))))

(assert (=> b!432430 (not (= (select (arr!12692 _keys!709) from!863) k0!794))))

(declare-fun lt!198252 () Unit!12764)

(assert (=> b!432430 (= lt!198252 e!255741)))

(declare-fun c!55530 () Bool)

(assert (=> b!432430 (= c!55530 (= (select (arr!12692 _keys!709) from!863) k0!794))))

(assert (=> b!432430 (= lt!198265 lt!198263)))

(declare-fun lt!198266 () ListLongMap!6451)

(assert (=> b!432430 (= lt!198263 (+!1416 lt!198266 lt!198256))))

(assert (=> b!432430 (= lt!198256 (tuple2!7549 (select (arr!12692 _keys!709) from!863) lt!198254))))

(declare-fun get!6313 (ValueCell!5321 V!16211) V!16211)

(declare-fun dynLambda!803 (Int (_ BitVec 64)) V!16211)

(assert (=> b!432430 (= lt!198254 (get!6313 (select (arr!12693 _values!549) from!863) (dynLambda!803 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432431 () Bool)

(declare-fun res!254426 () Bool)

(assert (=> b!432431 (=> (not res!254426) (not e!255746))))

(declare-fun arrayContainsKey!0 (array!26485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432431 (= res!254426 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18615 () Bool)

(declare-fun tp!36060 () Bool)

(assert (=> mapNonEmpty!18615 (= mapRes!18615 (and tp!36060 e!255745))))

(declare-fun mapKey!18615 () (_ BitVec 32))

(declare-fun mapValue!18615 () ValueCell!5321)

(declare-fun mapRest!18615 () (Array (_ BitVec 32) ValueCell!5321))

(assert (=> mapNonEmpty!18615 (= (arr!12693 _values!549) (store mapRest!18615 mapKey!18615 mapValue!18615))))

(declare-fun b!432432 () Bool)

(declare-fun Unit!12767 () Unit!12764)

(assert (=> b!432432 (= e!255741 Unit!12767)))

(declare-fun lt!198258 () Unit!12764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26485 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12764)

(assert (=> b!432432 (= lt!198258 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432432 false))

(declare-fun b!432433 () Bool)

(assert (=> b!432433 (= e!255742 (not e!255747))))

(declare-fun res!254424 () Bool)

(assert (=> b!432433 (=> res!254424 e!255747)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432433 (= res!254424 (not (validKeyInArray!0 (select (arr!12692 _keys!709) from!863))))))

(declare-fun lt!198255 () ListLongMap!6451)

(assert (=> b!432433 (= lt!198255 lt!198266)))

(assert (=> b!432433 (= lt!198266 (+!1416 lt!198264 lt!198259))))

(assert (=> b!432433 (= lt!198255 (getCurrentListMapNoExtraKeys!1445 lt!198261 lt!198260 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!432433 (= lt!198259 (tuple2!7549 k0!794 v!412))))

(assert (=> b!432433 (= lt!198264 (getCurrentListMapNoExtraKeys!1445 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198253 () Unit!12764)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!570 (array!26485 array!26487 (_ BitVec 32) (_ BitVec 32) V!16211 V!16211 (_ BitVec 32) (_ BitVec 64) V!16211 (_ BitVec 32) Int) Unit!12764)

(assert (=> b!432433 (= lt!198253 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!570 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432434 () Bool)

(declare-fun res!254432 () Bool)

(assert (=> b!432434 (=> (not res!254432) (not e!255746))))

(assert (=> b!432434 (= res!254432 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7539))))

(declare-fun b!432435 () Bool)

(declare-fun res!254425 () Bool)

(assert (=> b!432435 (=> (not res!254425) (not e!255746))))

(assert (=> b!432435 (= res!254425 (validKeyInArray!0 k0!794))))

(declare-fun b!432436 () Bool)

(declare-fun res!254431 () Bool)

(assert (=> b!432436 (=> (not res!254431) (not e!255744))))

(assert (=> b!432436 (= res!254431 (bvsle from!863 i!563))))

(assert (= (and start!39896 res!254428) b!432427))

(assert (= (and b!432427 res!254436) b!432429))

(assert (= (and b!432429 res!254434) b!432422))

(assert (= (and b!432422 res!254427) b!432434))

(assert (= (and b!432434 res!254432) b!432420))

(assert (= (and b!432420 res!254430) b!432435))

(assert (= (and b!432435 res!254425) b!432428))

(assert (= (and b!432428 res!254423) b!432431))

(assert (= (and b!432431 res!254426) b!432419))

(assert (= (and b!432419 res!254422) b!432421))

(assert (= (and b!432421 res!254435) b!432436))

(assert (= (and b!432436 res!254431) b!432426))

(assert (= (and b!432426 res!254433) b!432433))

(assert (= (and b!432433 (not res!254424)) b!432430))

(assert (= (and b!432430 c!55530) b!432432))

(assert (= (and b!432430 (not c!55530)) b!432418))

(assert (= (and b!432430 (not res!254429)) b!432423))

(assert (= (and b!432425 condMapEmpty!18615) mapIsEmpty!18615))

(assert (= (and b!432425 (not condMapEmpty!18615)) mapNonEmpty!18615))

(get-info :version)

(assert (= (and mapNonEmpty!18615 ((_ is ValueCellFull!5321) mapValue!18615)) b!432424))

(assert (= (and b!432425 ((_ is ValueCellFull!5321) mapDefault!18615)) b!432417))

(assert (= start!39896 b!432425))

(declare-fun b_lambda!9247 () Bool)

(assert (=> (not b_lambda!9247) (not b!432430)))

(declare-fun t!13158 () Bool)

(declare-fun tb!3575 () Bool)

(assert (=> (and start!39896 (= defaultEntry!557 defaultEntry!557) t!13158) tb!3575))

(declare-fun result!6685 () Bool)

(assert (=> tb!3575 (= result!6685 tp_is_empty!11329)))

(assert (=> b!432430 t!13158))

(declare-fun b_and!17989 () Bool)

(assert (= b_and!17987 (and (=> t!13158 result!6685) b_and!17989)))

(declare-fun m!420021 () Bool)

(assert (=> b!432430 m!420021))

(declare-fun m!420023 () Bool)

(assert (=> b!432430 m!420023))

(assert (=> b!432430 m!420023))

(assert (=> b!432430 m!420021))

(declare-fun m!420025 () Bool)

(assert (=> b!432430 m!420025))

(declare-fun m!420027 () Bool)

(assert (=> b!432430 m!420027))

(declare-fun m!420029 () Bool)

(assert (=> b!432430 m!420029))

(declare-fun m!420031 () Bool)

(assert (=> b!432422 m!420031))

(declare-fun m!420033 () Bool)

(assert (=> b!432435 m!420033))

(assert (=> b!432433 m!420029))

(declare-fun m!420035 () Bool)

(assert (=> b!432433 m!420035))

(assert (=> b!432433 m!420029))

(declare-fun m!420037 () Bool)

(assert (=> b!432433 m!420037))

(declare-fun m!420039 () Bool)

(assert (=> b!432433 m!420039))

(declare-fun m!420041 () Bool)

(assert (=> b!432433 m!420041))

(declare-fun m!420043 () Bool)

(assert (=> b!432433 m!420043))

(declare-fun m!420045 () Bool)

(assert (=> b!432427 m!420045))

(declare-fun m!420047 () Bool)

(assert (=> b!432432 m!420047))

(declare-fun m!420049 () Bool)

(assert (=> b!432423 m!420049))

(assert (=> b!432423 m!420049))

(declare-fun m!420051 () Bool)

(assert (=> b!432423 m!420051))

(assert (=> b!432423 m!420029))

(assert (=> b!432423 m!420029))

(declare-fun m!420053 () Bool)

(assert (=> b!432423 m!420053))

(declare-fun m!420055 () Bool)

(assert (=> b!432431 m!420055))

(declare-fun m!420057 () Bool)

(assert (=> start!39896 m!420057))

(declare-fun m!420059 () Bool)

(assert (=> start!39896 m!420059))

(declare-fun m!420061 () Bool)

(assert (=> b!432434 m!420061))

(declare-fun m!420063 () Bool)

(assert (=> b!432428 m!420063))

(declare-fun m!420065 () Bool)

(assert (=> b!432426 m!420065))

(declare-fun m!420067 () Bool)

(assert (=> b!432426 m!420067))

(declare-fun m!420069 () Bool)

(assert (=> b!432426 m!420069))

(declare-fun m!420071 () Bool)

(assert (=> b!432419 m!420071))

(declare-fun m!420073 () Bool)

(assert (=> b!432419 m!420073))

(declare-fun m!420075 () Bool)

(assert (=> mapNonEmpty!18615 m!420075))

(declare-fun m!420077 () Bool)

(assert (=> b!432421 m!420077))

(check-sat (not b!432435) (not b!432426) (not mapNonEmpty!18615) tp_is_empty!11329 (not b!432430) (not start!39896) (not b!432419) (not b_next!10177) (not b!432433) (not b!432422) (not b!432423) (not b_lambda!9247) (not b!432421) (not b!432434) (not b!432432) (not b!432427) b_and!17989 (not b!432431))
(check-sat b_and!17989 (not b_next!10177))
