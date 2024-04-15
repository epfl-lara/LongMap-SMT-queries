; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40404 () Bool)

(assert start!40404)

(declare-fun b!444227 () Bool)

(declare-fun e!261228 () Bool)

(declare-fun e!261225 () Bool)

(assert (=> b!444227 (= e!261228 e!261225)))

(declare-fun res!263453 () Bool)

(assert (=> b!444227 (=> (not res!263453) (not e!261225))))

(declare-datatypes ((array!27419 0))(
  ( (array!27420 (arr!13157 (Array (_ BitVec 32) (_ BitVec 64))) (size!13510 (_ BitVec 32))) )
))
(declare-fun lt!203267 () array!27419)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27419 (_ BitVec 32)) Bool)

(assert (=> b!444227 (= res!263453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203267 mask!1025))))

(declare-fun _keys!709 () array!27419)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444227 (= lt!203267 (array!27420 (store (arr!13157 _keys!709) i!563 k0!794) (size!13510 _keys!709)))))

(declare-fun b!444228 () Bool)

(declare-fun res!263456 () Bool)

(assert (=> b!444228 (=> (not res!263456) (not e!261228))))

(assert (=> b!444228 (= res!263456 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13510 _keys!709))))))

(declare-fun b!444229 () Bool)

(declare-fun res!263457 () Bool)

(assert (=> b!444229 (=> (not res!263457) (not e!261228))))

(assert (=> b!444229 (= res!263457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444230 () Bool)

(declare-fun res!263454 () Bool)

(assert (=> b!444230 (=> (not res!263454) (not e!261228))))

(declare-datatypes ((List!7877 0))(
  ( (Nil!7874) (Cons!7873 (h!8729 (_ BitVec 64)) (t!13626 List!7877)) )
))
(declare-fun arrayNoDuplicates!0 (array!27419 (_ BitVec 32) List!7877) Bool)

(assert (=> b!444230 (= res!263454 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7874))))

(declare-fun b!444231 () Bool)

(declare-fun res!263458 () Bool)

(assert (=> b!444231 (=> (not res!263458) (not e!261228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444231 (= res!263458 (validKeyInArray!0 k0!794))))

(declare-fun b!444232 () Bool)

(declare-fun e!261227 () Bool)

(declare-fun e!261230 () Bool)

(declare-fun mapRes!19332 () Bool)

(assert (=> b!444232 (= e!261227 (and e!261230 mapRes!19332))))

(declare-fun condMapEmpty!19332 () Bool)

(declare-datatypes ((V!16843 0))(
  ( (V!16844 (val!5946 Int)) )
))
(declare-datatypes ((ValueCell!5558 0))(
  ( (ValueCellFull!5558 (v!8191 V!16843)) (EmptyCell!5558) )
))
(declare-datatypes ((array!27421 0))(
  ( (array!27422 (arr!13158 (Array (_ BitVec 32) ValueCell!5558)) (size!13511 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27421)

(declare-fun mapDefault!19332 () ValueCell!5558)

(assert (=> b!444232 (= condMapEmpty!19332 (= (arr!13158 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5558)) mapDefault!19332)))))

(declare-fun b!444233 () Bool)

(declare-fun res!263460 () Bool)

(assert (=> b!444233 (=> (not res!263460) (not e!261228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444233 (= res!263460 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19332 () Bool)

(assert (=> mapIsEmpty!19332 mapRes!19332))

(declare-fun res!263455 () Bool)

(assert (=> start!40404 (=> (not res!263455) (not e!261228))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40404 (= res!263455 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13510 _keys!709))))))

(assert (=> start!40404 e!261228))

(assert (=> start!40404 true))

(declare-fun array_inv!9594 (array!27421) Bool)

(assert (=> start!40404 (and (array_inv!9594 _values!549) e!261227)))

(declare-fun array_inv!9595 (array!27419) Bool)

(assert (=> start!40404 (array_inv!9595 _keys!709)))

(declare-fun b!444226 () Bool)

(declare-fun res!263461 () Bool)

(assert (=> b!444226 (=> (not res!263461) (not e!261228))))

(declare-fun arrayContainsKey!0 (array!27419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444226 (= res!263461 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444234 () Bool)

(declare-fun tp_is_empty!11803 () Bool)

(assert (=> b!444234 (= e!261230 tp_is_empty!11803)))

(declare-fun b!444235 () Bool)

(declare-fun res!263459 () Bool)

(assert (=> b!444235 (=> (not res!263459) (not e!261228))))

(assert (=> b!444235 (= res!263459 (or (= (select (arr!13157 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13157 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444236 () Bool)

(declare-fun res!263452 () Bool)

(assert (=> b!444236 (=> (not res!263452) (not e!261228))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444236 (= res!263452 (and (= (size!13511 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13510 _keys!709) (size!13511 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444237 () Bool)

(assert (=> b!444237 (= e!261225 false)))

(declare-fun lt!203266 () Bool)

(assert (=> b!444237 (= lt!203266 (arrayNoDuplicates!0 lt!203267 #b00000000000000000000000000000000 Nil!7874))))

(declare-fun mapNonEmpty!19332 () Bool)

(declare-fun tp!37314 () Bool)

(declare-fun e!261229 () Bool)

(assert (=> mapNonEmpty!19332 (= mapRes!19332 (and tp!37314 e!261229))))

(declare-fun mapRest!19332 () (Array (_ BitVec 32) ValueCell!5558))

(declare-fun mapKey!19332 () (_ BitVec 32))

(declare-fun mapValue!19332 () ValueCell!5558)

(assert (=> mapNonEmpty!19332 (= (arr!13158 _values!549) (store mapRest!19332 mapKey!19332 mapValue!19332))))

(declare-fun b!444238 () Bool)

(assert (=> b!444238 (= e!261229 tp_is_empty!11803)))

(assert (= (and start!40404 res!263455) b!444233))

(assert (= (and b!444233 res!263460) b!444236))

(assert (= (and b!444236 res!263452) b!444229))

(assert (= (and b!444229 res!263457) b!444230))

(assert (= (and b!444230 res!263454) b!444228))

(assert (= (and b!444228 res!263456) b!444231))

(assert (= (and b!444231 res!263458) b!444235))

(assert (= (and b!444235 res!263459) b!444226))

(assert (= (and b!444226 res!263461) b!444227))

(assert (= (and b!444227 res!263453) b!444237))

(assert (= (and b!444232 condMapEmpty!19332) mapIsEmpty!19332))

(assert (= (and b!444232 (not condMapEmpty!19332)) mapNonEmpty!19332))

(get-info :version)

(assert (= (and mapNonEmpty!19332 ((_ is ValueCellFull!5558) mapValue!19332)) b!444238))

(assert (= (and b!444232 ((_ is ValueCellFull!5558) mapDefault!19332)) b!444234))

(assert (= start!40404 b!444232))

(declare-fun m!429625 () Bool)

(assert (=> b!444237 m!429625))

(declare-fun m!429627 () Bool)

(assert (=> b!444235 m!429627))

(declare-fun m!429629 () Bool)

(assert (=> mapNonEmpty!19332 m!429629))

(declare-fun m!429631 () Bool)

(assert (=> b!444227 m!429631))

(declare-fun m!429633 () Bool)

(assert (=> b!444227 m!429633))

(declare-fun m!429635 () Bool)

(assert (=> b!444226 m!429635))

(declare-fun m!429637 () Bool)

(assert (=> start!40404 m!429637))

(declare-fun m!429639 () Bool)

(assert (=> start!40404 m!429639))

(declare-fun m!429641 () Bool)

(assert (=> b!444229 m!429641))

(declare-fun m!429643 () Bool)

(assert (=> b!444230 m!429643))

(declare-fun m!429645 () Bool)

(assert (=> b!444233 m!429645))

(declare-fun m!429647 () Bool)

(assert (=> b!444231 m!429647))

(check-sat (not b!444227) (not b!444231) (not b!444233) (not b!444237) (not start!40404) (not b!444226) tp_is_empty!11803 (not b!444230) (not b!444229) (not mapNonEmpty!19332))
(check-sat)
