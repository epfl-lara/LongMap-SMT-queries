; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40398 () Bool)

(assert start!40398)

(declare-fun b!444331 () Bool)

(declare-fun res!263488 () Bool)

(declare-fun e!261314 () Bool)

(assert (=> b!444331 (=> (not res!263488) (not e!261314))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444331 (= res!263488 (validMask!0 mask!1025))))

(declare-fun b!444332 () Bool)

(declare-fun res!263496 () Bool)

(assert (=> b!444332 (=> (not res!263496) (not e!261314))))

(declare-datatypes ((array!27408 0))(
  ( (array!27409 (arr!13151 (Array (_ BitVec 32) (_ BitVec 64))) (size!13503 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27408)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444332 (= res!263496 (or (= (select (arr!13151 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13151 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444333 () Bool)

(declare-fun e!261318 () Bool)

(assert (=> b!444333 (= e!261318 false)))

(declare-fun lt!203501 () Bool)

(declare-fun lt!203502 () array!27408)

(declare-datatypes ((List!7783 0))(
  ( (Nil!7780) (Cons!7779 (h!8635 (_ BitVec 64)) (t!13533 List!7783)) )
))
(declare-fun arrayNoDuplicates!0 (array!27408 (_ BitVec 32) List!7783) Bool)

(assert (=> b!444333 (= lt!203501 (arrayNoDuplicates!0 lt!203502 #b00000000000000000000000000000000 Nil!7780))))

(declare-fun b!444334 () Bool)

(declare-fun res!263490 () Bool)

(assert (=> b!444334 (=> (not res!263490) (not e!261314))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444334 (= res!263490 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444335 () Bool)

(declare-fun e!261316 () Bool)

(declare-fun tp_is_empty!11797 () Bool)

(assert (=> b!444335 (= e!261316 tp_is_empty!11797)))

(declare-fun res!263494 () Bool)

(assert (=> start!40398 (=> (not res!263494) (not e!261314))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40398 (= res!263494 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13503 _keys!709))))))

(assert (=> start!40398 e!261314))

(assert (=> start!40398 true))

(declare-datatypes ((V!16835 0))(
  ( (V!16836 (val!5943 Int)) )
))
(declare-datatypes ((ValueCell!5555 0))(
  ( (ValueCellFull!5555 (v!8195 V!16835)) (EmptyCell!5555) )
))
(declare-datatypes ((array!27410 0))(
  ( (array!27411 (arr!13152 (Array (_ BitVec 32) ValueCell!5555)) (size!13504 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27410)

(declare-fun e!261313 () Bool)

(declare-fun array_inv!9612 (array!27410) Bool)

(assert (=> start!40398 (and (array_inv!9612 _values!549) e!261313)))

(declare-fun array_inv!9613 (array!27408) Bool)

(assert (=> start!40398 (array_inv!9613 _keys!709)))

(declare-fun b!444336 () Bool)

(declare-fun res!263489 () Bool)

(assert (=> b!444336 (=> (not res!263489) (not e!261314))))

(assert (=> b!444336 (= res!263489 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13503 _keys!709))))))

(declare-fun b!444337 () Bool)

(declare-fun e!261317 () Bool)

(declare-fun mapRes!19323 () Bool)

(assert (=> b!444337 (= e!261313 (and e!261317 mapRes!19323))))

(declare-fun condMapEmpty!19323 () Bool)

(declare-fun mapDefault!19323 () ValueCell!5555)

(assert (=> b!444337 (= condMapEmpty!19323 (= (arr!13152 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5555)) mapDefault!19323)))))

(declare-fun mapIsEmpty!19323 () Bool)

(assert (=> mapIsEmpty!19323 mapRes!19323))

(declare-fun b!444338 () Bool)

(declare-fun res!263495 () Bool)

(assert (=> b!444338 (=> (not res!263495) (not e!261314))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444338 (= res!263495 (and (= (size!13504 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13503 _keys!709) (size!13504 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444339 () Bool)

(declare-fun res!263492 () Bool)

(assert (=> b!444339 (=> (not res!263492) (not e!261314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444339 (= res!263492 (validKeyInArray!0 k0!794))))

(declare-fun b!444340 () Bool)

(assert (=> b!444340 (= e!261314 e!261318)))

(declare-fun res!263493 () Bool)

(assert (=> b!444340 (=> (not res!263493) (not e!261318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27408 (_ BitVec 32)) Bool)

(assert (=> b!444340 (= res!263493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203502 mask!1025))))

(assert (=> b!444340 (= lt!203502 (array!27409 (store (arr!13151 _keys!709) i!563 k0!794) (size!13503 _keys!709)))))

(declare-fun b!444341 () Bool)

(declare-fun res!263491 () Bool)

(assert (=> b!444341 (=> (not res!263491) (not e!261314))))

(assert (=> b!444341 (= res!263491 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7780))))

(declare-fun b!444342 () Bool)

(assert (=> b!444342 (= e!261317 tp_is_empty!11797)))

(declare-fun b!444343 () Bool)

(declare-fun res!263497 () Bool)

(assert (=> b!444343 (=> (not res!263497) (not e!261314))))

(assert (=> b!444343 (= res!263497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19323 () Bool)

(declare-fun tp!37305 () Bool)

(assert (=> mapNonEmpty!19323 (= mapRes!19323 (and tp!37305 e!261316))))

(declare-fun mapRest!19323 () (Array (_ BitVec 32) ValueCell!5555))

(declare-fun mapKey!19323 () (_ BitVec 32))

(declare-fun mapValue!19323 () ValueCell!5555)

(assert (=> mapNonEmpty!19323 (= (arr!13152 _values!549) (store mapRest!19323 mapKey!19323 mapValue!19323))))

(assert (= (and start!40398 res!263494) b!444331))

(assert (= (and b!444331 res!263488) b!444338))

(assert (= (and b!444338 res!263495) b!444343))

(assert (= (and b!444343 res!263497) b!444341))

(assert (= (and b!444341 res!263491) b!444336))

(assert (= (and b!444336 res!263489) b!444339))

(assert (= (and b!444339 res!263492) b!444332))

(assert (= (and b!444332 res!263496) b!444334))

(assert (= (and b!444334 res!263490) b!444340))

(assert (= (and b!444340 res!263493) b!444333))

(assert (= (and b!444337 condMapEmpty!19323) mapIsEmpty!19323))

(assert (= (and b!444337 (not condMapEmpty!19323)) mapNonEmpty!19323))

(get-info :version)

(assert (= (and mapNonEmpty!19323 ((_ is ValueCellFull!5555) mapValue!19323)) b!444335))

(assert (= (and b!444337 ((_ is ValueCellFull!5555) mapDefault!19323)) b!444342))

(assert (= start!40398 b!444337))

(declare-fun m!430503 () Bool)

(assert (=> b!444341 m!430503))

(declare-fun m!430505 () Bool)

(assert (=> mapNonEmpty!19323 m!430505))

(declare-fun m!430507 () Bool)

(assert (=> b!444333 m!430507))

(declare-fun m!430509 () Bool)

(assert (=> b!444339 m!430509))

(declare-fun m!430511 () Bool)

(assert (=> b!444340 m!430511))

(declare-fun m!430513 () Bool)

(assert (=> b!444340 m!430513))

(declare-fun m!430515 () Bool)

(assert (=> b!444332 m!430515))

(declare-fun m!430517 () Bool)

(assert (=> b!444343 m!430517))

(declare-fun m!430519 () Bool)

(assert (=> start!40398 m!430519))

(declare-fun m!430521 () Bool)

(assert (=> start!40398 m!430521))

(declare-fun m!430523 () Bool)

(assert (=> b!444331 m!430523))

(declare-fun m!430525 () Bool)

(assert (=> b!444334 m!430525))

(check-sat (not start!40398) (not b!444343) (not b!444333) tp_is_empty!11797 (not b!444331) (not mapNonEmpty!19323) (not b!444340) (not b!444334) (not b!444341) (not b!444339))
(check-sat)
