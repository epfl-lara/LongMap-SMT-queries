; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39168 () Bool)

(assert start!39168)

(declare-fun b_free!9435 () Bool)

(declare-fun b_next!9435 () Bool)

(assert (=> start!39168 (= b_free!9435 (not b_next!9435))))

(declare-fun tp!33833 () Bool)

(declare-fun b_and!16821 () Bool)

(assert (=> start!39168 (= tp!33833 b_and!16821)))

(declare-fun mapNonEmpty!17502 () Bool)

(declare-fun mapRes!17502 () Bool)

(declare-fun tp!33834 () Bool)

(declare-fun e!246791 () Bool)

(assert (=> mapNonEmpty!17502 (= mapRes!17502 (and tp!33834 e!246791))))

(declare-datatypes ((V!15221 0))(
  ( (V!15222 (val!5338 Int)) )
))
(declare-datatypes ((ValueCell!4950 0))(
  ( (ValueCellFull!4950 (v!7585 V!15221)) (EmptyCell!4950) )
))
(declare-fun mapRest!17502 () (Array (_ BitVec 32) ValueCell!4950))

(declare-fun mapValue!17502 () ValueCell!4950)

(declare-datatypes ((array!25035 0))(
  ( (array!25036 (arr!11967 (Array (_ BitVec 32) ValueCell!4950)) (size!12319 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25035)

(declare-fun mapKey!17502 () (_ BitVec 32))

(assert (=> mapNonEmpty!17502 (= (arr!11967 _values!549) (store mapRest!17502 mapKey!17502 mapValue!17502))))

(declare-fun b!412392 () Bool)

(declare-fun res!239454 () Bool)

(declare-fun e!246792 () Bool)

(assert (=> b!412392 (=> (not res!239454) (not e!246792))))

(declare-datatypes ((array!25037 0))(
  ( (array!25038 (arr!11968 (Array (_ BitVec 32) (_ BitVec 64))) (size!12320 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25037)

(declare-datatypes ((List!6952 0))(
  ( (Nil!6949) (Cons!6948 (h!7804 (_ BitVec 64)) (t!12126 List!6952)) )
))
(declare-fun arrayNoDuplicates!0 (array!25037 (_ BitVec 32) List!6952) Bool)

(assert (=> b!412392 (= res!239454 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6949))))

(declare-fun b!412393 () Bool)

(declare-fun res!239459 () Bool)

(declare-fun e!246788 () Bool)

(assert (=> b!412393 (=> (not res!239459) (not e!246788))))

(declare-fun lt!189471 () array!25037)

(assert (=> b!412393 (= res!239459 (arrayNoDuplicates!0 lt!189471 #b00000000000000000000000000000000 Nil!6949))))

(declare-fun b!412394 () Bool)

(declare-fun res!239453 () Bool)

(assert (=> b!412394 (=> (not res!239453) (not e!246792))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412394 (= res!239453 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12320 _keys!709))))))

(declare-fun b!412395 () Bool)

(declare-fun e!246790 () Bool)

(declare-fun e!246789 () Bool)

(assert (=> b!412395 (= e!246790 (and e!246789 mapRes!17502))))

(declare-fun condMapEmpty!17502 () Bool)

(declare-fun mapDefault!17502 () ValueCell!4950)

(assert (=> b!412395 (= condMapEmpty!17502 (= (arr!11967 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4950)) mapDefault!17502)))))

(declare-fun b!412396 () Bool)

(declare-fun res!239458 () Bool)

(assert (=> b!412396 (=> (not res!239458) (not e!246792))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412396 (= res!239458 (validMask!0 mask!1025))))

(declare-fun b!412397 () Bool)

(assert (=> b!412397 (= e!246792 e!246788)))

(declare-fun res!239461 () Bool)

(assert (=> b!412397 (=> (not res!239461) (not e!246788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25037 (_ BitVec 32)) Bool)

(assert (=> b!412397 (= res!239461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189471 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!412397 (= lt!189471 (array!25038 (store (arr!11968 _keys!709) i!563 k0!794) (size!12320 _keys!709)))))

(declare-fun b!412398 () Bool)

(assert (=> b!412398 (= e!246788 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15221)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15221)

(declare-datatypes ((tuple2!6926 0))(
  ( (tuple2!6927 (_1!3474 (_ BitVec 64)) (_2!3474 V!15221)) )
))
(declare-datatypes ((List!6953 0))(
  ( (Nil!6950) (Cons!6949 (h!7805 tuple2!6926) (t!12127 List!6953)) )
))
(declare-datatypes ((ListLongMap!5839 0))(
  ( (ListLongMap!5840 (toList!2935 List!6953)) )
))
(declare-fun lt!189472 () ListLongMap!5839)

(declare-fun v!412 () V!15221)

(declare-fun getCurrentListMapNoExtraKeys!1143 (array!25037 array!25035 (_ BitVec 32) (_ BitVec 32) V!15221 V!15221 (_ BitVec 32) Int) ListLongMap!5839)

(assert (=> b!412398 (= lt!189472 (getCurrentListMapNoExtraKeys!1143 lt!189471 (array!25036 (store (arr!11967 _values!549) i!563 (ValueCellFull!4950 v!412)) (size!12319 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189473 () ListLongMap!5839)

(assert (=> b!412398 (= lt!189473 (getCurrentListMapNoExtraKeys!1143 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!17502 () Bool)

(assert (=> mapIsEmpty!17502 mapRes!17502))

(declare-fun b!412399 () Bool)

(declare-fun res!239456 () Bool)

(assert (=> b!412399 (=> (not res!239456) (not e!246792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412399 (= res!239456 (validKeyInArray!0 k0!794))))

(declare-fun b!412400 () Bool)

(declare-fun tp_is_empty!10587 () Bool)

(assert (=> b!412400 (= e!246789 tp_is_empty!10587)))

(declare-fun b!412401 () Bool)

(declare-fun res!239460 () Bool)

(assert (=> b!412401 (=> (not res!239460) (not e!246792))))

(assert (=> b!412401 (= res!239460 (and (= (size!12319 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12320 _keys!709) (size!12319 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412402 () Bool)

(declare-fun res!239457 () Bool)

(assert (=> b!412402 (=> (not res!239457) (not e!246792))))

(assert (=> b!412402 (= res!239457 (or (= (select (arr!11968 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11968 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412403 () Bool)

(declare-fun res!239463 () Bool)

(assert (=> b!412403 (=> (not res!239463) (not e!246792))))

(declare-fun arrayContainsKey!0 (array!25037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412403 (= res!239463 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!239452 () Bool)

(assert (=> start!39168 (=> (not res!239452) (not e!246792))))

(assert (=> start!39168 (= res!239452 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12320 _keys!709))))))

(assert (=> start!39168 e!246792))

(assert (=> start!39168 tp_is_empty!10587))

(assert (=> start!39168 tp!33833))

(assert (=> start!39168 true))

(declare-fun array_inv!8724 (array!25035) Bool)

(assert (=> start!39168 (and (array_inv!8724 _values!549) e!246790)))

(declare-fun array_inv!8725 (array!25037) Bool)

(assert (=> start!39168 (array_inv!8725 _keys!709)))

(declare-fun b!412404 () Bool)

(declare-fun res!239455 () Bool)

(assert (=> b!412404 (=> (not res!239455) (not e!246788))))

(assert (=> b!412404 (= res!239455 (bvsle from!863 i!563))))

(declare-fun b!412405 () Bool)

(declare-fun res!239462 () Bool)

(assert (=> b!412405 (=> (not res!239462) (not e!246792))))

(assert (=> b!412405 (= res!239462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412406 () Bool)

(assert (=> b!412406 (= e!246791 tp_is_empty!10587)))

(assert (= (and start!39168 res!239452) b!412396))

(assert (= (and b!412396 res!239458) b!412401))

(assert (= (and b!412401 res!239460) b!412405))

(assert (= (and b!412405 res!239462) b!412392))

(assert (= (and b!412392 res!239454) b!412394))

(assert (= (and b!412394 res!239453) b!412399))

(assert (= (and b!412399 res!239456) b!412402))

(assert (= (and b!412402 res!239457) b!412403))

(assert (= (and b!412403 res!239463) b!412397))

(assert (= (and b!412397 res!239461) b!412393))

(assert (= (and b!412393 res!239459) b!412404))

(assert (= (and b!412404 res!239455) b!412398))

(assert (= (and b!412395 condMapEmpty!17502) mapIsEmpty!17502))

(assert (= (and b!412395 (not condMapEmpty!17502)) mapNonEmpty!17502))

(get-info :version)

(assert (= (and mapNonEmpty!17502 ((_ is ValueCellFull!4950) mapValue!17502)) b!412406))

(assert (= (and b!412395 ((_ is ValueCellFull!4950) mapDefault!17502)) b!412400))

(assert (= start!39168 b!412395))

(declare-fun m!402223 () Bool)

(assert (=> b!412403 m!402223))

(declare-fun m!402225 () Bool)

(assert (=> b!412396 m!402225))

(declare-fun m!402227 () Bool)

(assert (=> start!39168 m!402227))

(declare-fun m!402229 () Bool)

(assert (=> start!39168 m!402229))

(declare-fun m!402231 () Bool)

(assert (=> b!412398 m!402231))

(declare-fun m!402233 () Bool)

(assert (=> b!412398 m!402233))

(declare-fun m!402235 () Bool)

(assert (=> b!412398 m!402235))

(declare-fun m!402237 () Bool)

(assert (=> b!412399 m!402237))

(declare-fun m!402239 () Bool)

(assert (=> mapNonEmpty!17502 m!402239))

(declare-fun m!402241 () Bool)

(assert (=> b!412405 m!402241))

(declare-fun m!402243 () Bool)

(assert (=> b!412402 m!402243))

(declare-fun m!402245 () Bool)

(assert (=> b!412393 m!402245))

(declare-fun m!402247 () Bool)

(assert (=> b!412397 m!402247))

(declare-fun m!402249 () Bool)

(assert (=> b!412397 m!402249))

(declare-fun m!402251 () Bool)

(assert (=> b!412392 m!402251))

(check-sat (not b!412405) (not b!412396) tp_is_empty!10587 (not b!412398) (not mapNonEmpty!17502) (not b!412397) (not b!412392) b_and!16821 (not start!39168) (not b!412393) (not b!412403) (not b_next!9435) (not b!412399))
(check-sat b_and!16821 (not b_next!9435))
