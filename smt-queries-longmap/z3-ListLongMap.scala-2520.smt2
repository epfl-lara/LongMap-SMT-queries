; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38924 () Bool)

(assert start!38924)

(declare-fun b!407212 () Bool)

(declare-fun e!244545 () Bool)

(declare-fun e!244543 () Bool)

(assert (=> b!407212 (= e!244545 e!244543)))

(declare-fun res!235454 () Bool)

(assert (=> b!407212 (=> (not res!235454) (not e!244543))))

(declare-datatypes ((array!24585 0))(
  ( (array!24586 (arr!11742 (Array (_ BitVec 32) (_ BitVec 64))) (size!12095 (_ BitVec 32))) )
))
(declare-fun lt!188416 () array!24585)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24585 (_ BitVec 32)) Bool)

(assert (=> b!407212 (= res!235454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188416 mask!1025))))

(declare-fun _keys!709 () array!24585)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407212 (= lt!188416 (array!24586 (store (arr!11742 _keys!709) i!563 k0!794) (size!12095 _keys!709)))))

(declare-fun b!407213 () Bool)

(assert (=> b!407213 (= e!244543 false)))

(declare-fun lt!188417 () Bool)

(declare-datatypes ((List!6788 0))(
  ( (Nil!6785) (Cons!6784 (h!7640 (_ BitVec 64)) (t!11953 List!6788)) )
))
(declare-fun arrayNoDuplicates!0 (array!24585 (_ BitVec 32) List!6788) Bool)

(assert (=> b!407213 (= lt!188417 (arrayNoDuplicates!0 lt!188416 #b00000000000000000000000000000000 Nil!6785))))

(declare-fun mapNonEmpty!17157 () Bool)

(declare-fun mapRes!17157 () Bool)

(declare-fun tp!33276 () Bool)

(declare-fun e!244547 () Bool)

(assert (=> mapNonEmpty!17157 (= mapRes!17157 (and tp!33276 e!244547))))

(declare-fun mapKey!17157 () (_ BitVec 32))

(declare-datatypes ((V!14915 0))(
  ( (V!14916 (val!5223 Int)) )
))
(declare-datatypes ((ValueCell!4835 0))(
  ( (ValueCellFull!4835 (v!7464 V!14915)) (EmptyCell!4835) )
))
(declare-fun mapValue!17157 () ValueCell!4835)

(declare-fun mapRest!17157 () (Array (_ BitVec 32) ValueCell!4835))

(declare-datatypes ((array!24587 0))(
  ( (array!24588 (arr!11743 (Array (_ BitVec 32) ValueCell!4835)) (size!12096 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24587)

(assert (=> mapNonEmpty!17157 (= (arr!11743 _values!549) (store mapRest!17157 mapKey!17157 mapValue!17157))))

(declare-fun mapIsEmpty!17157 () Bool)

(assert (=> mapIsEmpty!17157 mapRes!17157))

(declare-fun b!407214 () Bool)

(declare-fun e!244546 () Bool)

(declare-fun e!244548 () Bool)

(assert (=> b!407214 (= e!244546 (and e!244548 mapRes!17157))))

(declare-fun condMapEmpty!17157 () Bool)

(declare-fun mapDefault!17157 () ValueCell!4835)

(assert (=> b!407214 (= condMapEmpty!17157 (= (arr!11743 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4835)) mapDefault!17157)))))

(declare-fun b!407215 () Bool)

(declare-fun res!235458 () Bool)

(assert (=> b!407215 (=> (not res!235458) (not e!244545))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407215 (= res!235458 (and (= (size!12096 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12095 _keys!709) (size!12096 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407216 () Bool)

(declare-fun res!235450 () Bool)

(assert (=> b!407216 (=> (not res!235450) (not e!244545))))

(declare-fun arrayContainsKey!0 (array!24585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407216 (= res!235450 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407217 () Bool)

(declare-fun res!235455 () Bool)

(assert (=> b!407217 (=> (not res!235455) (not e!244545))))

(assert (=> b!407217 (= res!235455 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6785))))

(declare-fun res!235457 () Bool)

(assert (=> start!38924 (=> (not res!235457) (not e!244545))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38924 (= res!235457 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12095 _keys!709))))))

(assert (=> start!38924 e!244545))

(assert (=> start!38924 true))

(declare-fun array_inv!8612 (array!24587) Bool)

(assert (=> start!38924 (and (array_inv!8612 _values!549) e!244546)))

(declare-fun array_inv!8613 (array!24585) Bool)

(assert (=> start!38924 (array_inv!8613 _keys!709)))

(declare-fun b!407218 () Bool)

(declare-fun res!235452 () Bool)

(assert (=> b!407218 (=> (not res!235452) (not e!244545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407218 (= res!235452 (validMask!0 mask!1025))))

(declare-fun b!407219 () Bool)

(declare-fun tp_is_empty!10357 () Bool)

(assert (=> b!407219 (= e!244547 tp_is_empty!10357)))

(declare-fun b!407220 () Bool)

(declare-fun res!235453 () Bool)

(assert (=> b!407220 (=> (not res!235453) (not e!244545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407220 (= res!235453 (validKeyInArray!0 k0!794))))

(declare-fun b!407221 () Bool)

(declare-fun res!235456 () Bool)

(assert (=> b!407221 (=> (not res!235456) (not e!244545))))

(assert (=> b!407221 (= res!235456 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12095 _keys!709))))))

(declare-fun b!407222 () Bool)

(declare-fun res!235449 () Bool)

(assert (=> b!407222 (=> (not res!235449) (not e!244545))))

(assert (=> b!407222 (= res!235449 (or (= (select (arr!11742 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11742 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407223 () Bool)

(assert (=> b!407223 (= e!244548 tp_is_empty!10357)))

(declare-fun b!407224 () Bool)

(declare-fun res!235451 () Bool)

(assert (=> b!407224 (=> (not res!235451) (not e!244545))))

(assert (=> b!407224 (= res!235451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38924 res!235457) b!407218))

(assert (= (and b!407218 res!235452) b!407215))

(assert (= (and b!407215 res!235458) b!407224))

(assert (= (and b!407224 res!235451) b!407217))

(assert (= (and b!407217 res!235455) b!407221))

(assert (= (and b!407221 res!235456) b!407220))

(assert (= (and b!407220 res!235453) b!407222))

(assert (= (and b!407222 res!235449) b!407216))

(assert (= (and b!407216 res!235450) b!407212))

(assert (= (and b!407212 res!235454) b!407213))

(assert (= (and b!407214 condMapEmpty!17157) mapIsEmpty!17157))

(assert (= (and b!407214 (not condMapEmpty!17157)) mapNonEmpty!17157))

(get-info :version)

(assert (= (and mapNonEmpty!17157 ((_ is ValueCellFull!4835) mapValue!17157)) b!407219))

(assert (= (and b!407214 ((_ is ValueCellFull!4835) mapDefault!17157)) b!407223))

(assert (= start!38924 b!407214))

(declare-fun m!398427 () Bool)

(assert (=> b!407220 m!398427))

(declare-fun m!398429 () Bool)

(assert (=> mapNonEmpty!17157 m!398429))

(declare-fun m!398431 () Bool)

(assert (=> b!407217 m!398431))

(declare-fun m!398433 () Bool)

(assert (=> b!407218 m!398433))

(declare-fun m!398435 () Bool)

(assert (=> b!407216 m!398435))

(declare-fun m!398437 () Bool)

(assert (=> b!407212 m!398437))

(declare-fun m!398439 () Bool)

(assert (=> b!407212 m!398439))

(declare-fun m!398441 () Bool)

(assert (=> start!38924 m!398441))

(declare-fun m!398443 () Bool)

(assert (=> start!38924 m!398443))

(declare-fun m!398445 () Bool)

(assert (=> b!407224 m!398445))

(declare-fun m!398447 () Bool)

(assert (=> b!407222 m!398447))

(declare-fun m!398449 () Bool)

(assert (=> b!407213 m!398449))

(check-sat (not start!38924) tp_is_empty!10357 (not b!407212) (not b!407217) (not b!407213) (not b!407216) (not b!407224) (not b!407218) (not b!407220) (not mapNonEmpty!17157))
(check-sat)
