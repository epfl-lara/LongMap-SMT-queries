; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38874 () Bool)

(assert start!38874)

(declare-fun b!406235 () Bool)

(declare-fun e!244142 () Bool)

(declare-fun tp_is_empty!10293 () Bool)

(assert (=> b!406235 (= e!244142 tp_is_empty!10293)))

(declare-fun b!406236 () Bool)

(declare-fun res!234627 () Bool)

(declare-fun e!244146 () Bool)

(assert (=> b!406236 (=> (not res!234627) (not e!244146))))

(declare-datatypes ((array!24477 0))(
  ( (array!24478 (arr!11688 (Array (_ BitVec 32) (_ BitVec 64))) (size!12040 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24477)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24477 (_ BitVec 32)) Bool)

(assert (=> b!406236 (= res!234627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406237 () Bool)

(declare-fun res!234620 () Bool)

(assert (=> b!406237 (=> (not res!234620) (not e!244146))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14829 0))(
  ( (V!14830 (val!5191 Int)) )
))
(declare-datatypes ((ValueCell!4803 0))(
  ( (ValueCellFull!4803 (v!7438 V!14829)) (EmptyCell!4803) )
))
(declare-datatypes ((array!24479 0))(
  ( (array!24480 (arr!11689 (Array (_ BitVec 32) ValueCell!4803)) (size!12041 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24479)

(assert (=> b!406237 (= res!234620 (and (= (size!12041 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12040 _keys!709) (size!12041 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!234622 () Bool)

(assert (=> start!38874 (=> (not res!234622) (not e!244146))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38874 (= res!234622 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12040 _keys!709))))))

(assert (=> start!38874 e!244146))

(assert (=> start!38874 true))

(declare-fun e!244145 () Bool)

(declare-fun array_inv!8536 (array!24479) Bool)

(assert (=> start!38874 (and (array_inv!8536 _values!549) e!244145)))

(declare-fun array_inv!8537 (array!24477) Bool)

(assert (=> start!38874 (array_inv!8537 _keys!709)))

(declare-fun b!406238 () Bool)

(declare-fun res!234619 () Bool)

(assert (=> b!406238 (=> (not res!234619) (not e!244146))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406238 (= res!234619 (validKeyInArray!0 k0!794))))

(declare-fun b!406239 () Bool)

(declare-fun res!234621 () Bool)

(assert (=> b!406239 (=> (not res!234621) (not e!244146))))

(declare-datatypes ((List!6789 0))(
  ( (Nil!6786) (Cons!6785 (h!7641 (_ BitVec 64)) (t!11963 List!6789)) )
))
(declare-fun arrayNoDuplicates!0 (array!24477 (_ BitVec 32) List!6789) Bool)

(assert (=> b!406239 (= res!234621 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6786))))

(declare-fun b!406240 () Bool)

(declare-fun e!244144 () Bool)

(assert (=> b!406240 (= e!244144 tp_is_empty!10293)))

(declare-fun mapNonEmpty!17061 () Bool)

(declare-fun mapRes!17061 () Bool)

(declare-fun tp!33180 () Bool)

(assert (=> mapNonEmpty!17061 (= mapRes!17061 (and tp!33180 e!244144))))

(declare-fun mapValue!17061 () ValueCell!4803)

(declare-fun mapRest!17061 () (Array (_ BitVec 32) ValueCell!4803))

(declare-fun mapKey!17061 () (_ BitVec 32))

(assert (=> mapNonEmpty!17061 (= (arr!11689 _values!549) (store mapRest!17061 mapKey!17061 mapValue!17061))))

(declare-fun b!406241 () Bool)

(declare-fun res!234626 () Bool)

(assert (=> b!406241 (=> (not res!234626) (not e!244146))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406241 (= res!234626 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12040 _keys!709))))))

(declare-fun b!406242 () Bool)

(declare-fun e!244143 () Bool)

(assert (=> b!406242 (= e!244146 e!244143)))

(declare-fun res!234618 () Bool)

(assert (=> b!406242 (=> (not res!234618) (not e!244143))))

(declare-fun lt!188459 () array!24477)

(assert (=> b!406242 (= res!234618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188459 mask!1025))))

(assert (=> b!406242 (= lt!188459 (array!24478 (store (arr!11688 _keys!709) i!563 k0!794) (size!12040 _keys!709)))))

(declare-fun b!406243 () Bool)

(declare-fun res!234625 () Bool)

(assert (=> b!406243 (=> (not res!234625) (not e!244146))))

(declare-fun arrayContainsKey!0 (array!24477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406243 (= res!234625 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406244 () Bool)

(assert (=> b!406244 (= e!244143 false)))

(declare-fun lt!188458 () Bool)

(assert (=> b!406244 (= lt!188458 (arrayNoDuplicates!0 lt!188459 #b00000000000000000000000000000000 Nil!6786))))

(declare-fun b!406245 () Bool)

(assert (=> b!406245 (= e!244145 (and e!244142 mapRes!17061))))

(declare-fun condMapEmpty!17061 () Bool)

(declare-fun mapDefault!17061 () ValueCell!4803)

(assert (=> b!406245 (= condMapEmpty!17061 (= (arr!11689 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4803)) mapDefault!17061)))))

(declare-fun mapIsEmpty!17061 () Bool)

(assert (=> mapIsEmpty!17061 mapRes!17061))

(declare-fun b!406246 () Bool)

(declare-fun res!234623 () Bool)

(assert (=> b!406246 (=> (not res!234623) (not e!244146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406246 (= res!234623 (validMask!0 mask!1025))))

(declare-fun b!406247 () Bool)

(declare-fun res!234624 () Bool)

(assert (=> b!406247 (=> (not res!234624) (not e!244146))))

(assert (=> b!406247 (= res!234624 (or (= (select (arr!11688 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11688 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38874 res!234622) b!406246))

(assert (= (and b!406246 res!234623) b!406237))

(assert (= (and b!406237 res!234620) b!406236))

(assert (= (and b!406236 res!234627) b!406239))

(assert (= (and b!406239 res!234621) b!406241))

(assert (= (and b!406241 res!234626) b!406238))

(assert (= (and b!406238 res!234619) b!406247))

(assert (= (and b!406247 res!234624) b!406243))

(assert (= (and b!406243 res!234625) b!406242))

(assert (= (and b!406242 res!234618) b!406244))

(assert (= (and b!406245 condMapEmpty!17061) mapIsEmpty!17061))

(assert (= (and b!406245 (not condMapEmpty!17061)) mapNonEmpty!17061))

(get-info :version)

(assert (= (and mapNonEmpty!17061 ((_ is ValueCellFull!4803) mapValue!17061)) b!406240))

(assert (= (and b!406245 ((_ is ValueCellFull!4803) mapDefault!17061)) b!406235))

(assert (= start!38874 b!406245))

(declare-fun m!398383 () Bool)

(assert (=> b!406239 m!398383))

(declare-fun m!398385 () Bool)

(assert (=> b!406243 m!398385))

(declare-fun m!398387 () Bool)

(assert (=> b!406236 m!398387))

(declare-fun m!398389 () Bool)

(assert (=> b!406238 m!398389))

(declare-fun m!398391 () Bool)

(assert (=> b!406244 m!398391))

(declare-fun m!398393 () Bool)

(assert (=> start!38874 m!398393))

(declare-fun m!398395 () Bool)

(assert (=> start!38874 m!398395))

(declare-fun m!398397 () Bool)

(assert (=> mapNonEmpty!17061 m!398397))

(declare-fun m!398399 () Bool)

(assert (=> b!406247 m!398399))

(declare-fun m!398401 () Bool)

(assert (=> b!406242 m!398401))

(declare-fun m!398403 () Bool)

(assert (=> b!406242 m!398403))

(declare-fun m!398405 () Bool)

(assert (=> b!406246 m!398405))

(check-sat (not b!406238) (not start!38874) (not b!406242) tp_is_empty!10293 (not b!406244) (not b!406246) (not b!406243) (not mapNonEmpty!17061) (not b!406239) (not b!406236))
(check-sat)
