; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40410 () Bool)

(assert start!40410)

(declare-fun b!444343 () Bool)

(declare-fun res!263550 () Bool)

(declare-fun e!261280 () Bool)

(assert (=> b!444343 (=> (not res!263550) (not e!261280))))

(declare-datatypes ((array!27431 0))(
  ( (array!27432 (arr!13163 (Array (_ BitVec 32) (_ BitVec 64))) (size!13516 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27431)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16851 0))(
  ( (V!16852 (val!5949 Int)) )
))
(declare-datatypes ((ValueCell!5561 0))(
  ( (ValueCellFull!5561 (v!8194 V!16851)) (EmptyCell!5561) )
))
(declare-datatypes ((array!27433 0))(
  ( (array!27434 (arr!13164 (Array (_ BitVec 32) ValueCell!5561)) (size!13517 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27433)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!444343 (= res!263550 (and (= (size!13517 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13516 _keys!709) (size!13517 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19341 () Bool)

(declare-fun mapRes!19341 () Bool)

(assert (=> mapIsEmpty!19341 mapRes!19341))

(declare-fun b!444344 () Bool)

(declare-fun res!263547 () Bool)

(assert (=> b!444344 (=> (not res!263547) (not e!261280))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444344 (= res!263547 (validKeyInArray!0 k0!794))))

(declare-fun b!444345 () Bool)

(declare-fun e!261283 () Bool)

(declare-fun tp_is_empty!11809 () Bool)

(assert (=> b!444345 (= e!261283 tp_is_empty!11809)))

(declare-fun b!444346 () Bool)

(declare-fun e!261284 () Bool)

(assert (=> b!444346 (= e!261284 tp_is_empty!11809)))

(declare-fun b!444347 () Bool)

(declare-fun res!263542 () Bool)

(assert (=> b!444347 (=> (not res!263542) (not e!261280))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444347 (= res!263542 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13516 _keys!709))))))

(declare-fun b!444349 () Bool)

(declare-fun res!263549 () Bool)

(assert (=> b!444349 (=> (not res!263549) (not e!261280))))

(declare-datatypes ((List!7880 0))(
  ( (Nil!7877) (Cons!7876 (h!8732 (_ BitVec 64)) (t!13629 List!7880)) )
))
(declare-fun arrayNoDuplicates!0 (array!27431 (_ BitVec 32) List!7880) Bool)

(assert (=> b!444349 (= res!263549 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7877))))

(declare-fun b!444350 () Bool)

(declare-fun res!263543 () Bool)

(assert (=> b!444350 (=> (not res!263543) (not e!261280))))

(declare-fun arrayContainsKey!0 (array!27431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444350 (= res!263543 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444351 () Bool)

(declare-fun res!263546 () Bool)

(assert (=> b!444351 (=> (not res!263546) (not e!261280))))

(assert (=> b!444351 (= res!263546 (or (= (select (arr!13163 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13163 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444352 () Bool)

(declare-fun e!261279 () Bool)

(assert (=> b!444352 (= e!261279 (and e!261283 mapRes!19341))))

(declare-fun condMapEmpty!19341 () Bool)

(declare-fun mapDefault!19341 () ValueCell!5561)

(assert (=> b!444352 (= condMapEmpty!19341 (= (arr!13164 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5561)) mapDefault!19341)))))

(declare-fun res!263544 () Bool)

(assert (=> start!40410 (=> (not res!263544) (not e!261280))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40410 (= res!263544 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13516 _keys!709))))))

(assert (=> start!40410 e!261280))

(assert (=> start!40410 true))

(declare-fun array_inv!9598 (array!27433) Bool)

(assert (=> start!40410 (and (array_inv!9598 _values!549) e!261279)))

(declare-fun array_inv!9599 (array!27431) Bool)

(assert (=> start!40410 (array_inv!9599 _keys!709)))

(declare-fun b!444348 () Bool)

(declare-fun e!261281 () Bool)

(assert (=> b!444348 (= e!261281 false)))

(declare-fun lt!203284 () Bool)

(declare-fun lt!203285 () array!27431)

(assert (=> b!444348 (= lt!203284 (arrayNoDuplicates!0 lt!203285 #b00000000000000000000000000000000 Nil!7877))))

(declare-fun b!444353 () Bool)

(declare-fun res!263548 () Bool)

(assert (=> b!444353 (=> (not res!263548) (not e!261280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27431 (_ BitVec 32)) Bool)

(assert (=> b!444353 (= res!263548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444354 () Bool)

(declare-fun res!263551 () Bool)

(assert (=> b!444354 (=> (not res!263551) (not e!261280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444354 (= res!263551 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19341 () Bool)

(declare-fun tp!37323 () Bool)

(assert (=> mapNonEmpty!19341 (= mapRes!19341 (and tp!37323 e!261284))))

(declare-fun mapValue!19341 () ValueCell!5561)

(declare-fun mapRest!19341 () (Array (_ BitVec 32) ValueCell!5561))

(declare-fun mapKey!19341 () (_ BitVec 32))

(assert (=> mapNonEmpty!19341 (= (arr!13164 _values!549) (store mapRest!19341 mapKey!19341 mapValue!19341))))

(declare-fun b!444355 () Bool)

(assert (=> b!444355 (= e!261280 e!261281)))

(declare-fun res!263545 () Bool)

(assert (=> b!444355 (=> (not res!263545) (not e!261281))))

(assert (=> b!444355 (= res!263545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203285 mask!1025))))

(assert (=> b!444355 (= lt!203285 (array!27432 (store (arr!13163 _keys!709) i!563 k0!794) (size!13516 _keys!709)))))

(assert (= (and start!40410 res!263544) b!444354))

(assert (= (and b!444354 res!263551) b!444343))

(assert (= (and b!444343 res!263550) b!444353))

(assert (= (and b!444353 res!263548) b!444349))

(assert (= (and b!444349 res!263549) b!444347))

(assert (= (and b!444347 res!263542) b!444344))

(assert (= (and b!444344 res!263547) b!444351))

(assert (= (and b!444351 res!263546) b!444350))

(assert (= (and b!444350 res!263543) b!444355))

(assert (= (and b!444355 res!263545) b!444348))

(assert (= (and b!444352 condMapEmpty!19341) mapIsEmpty!19341))

(assert (= (and b!444352 (not condMapEmpty!19341)) mapNonEmpty!19341))

(get-info :version)

(assert (= (and mapNonEmpty!19341 ((_ is ValueCellFull!5561) mapValue!19341)) b!444346))

(assert (= (and b!444352 ((_ is ValueCellFull!5561) mapDefault!19341)) b!444345))

(assert (= start!40410 b!444352))

(declare-fun m!429697 () Bool)

(assert (=> b!444348 m!429697))

(declare-fun m!429699 () Bool)

(assert (=> mapNonEmpty!19341 m!429699))

(declare-fun m!429701 () Bool)

(assert (=> b!444355 m!429701))

(declare-fun m!429703 () Bool)

(assert (=> b!444355 m!429703))

(declare-fun m!429705 () Bool)

(assert (=> b!444349 m!429705))

(declare-fun m!429707 () Bool)

(assert (=> b!444353 m!429707))

(declare-fun m!429709 () Bool)

(assert (=> b!444350 m!429709))

(declare-fun m!429711 () Bool)

(assert (=> b!444351 m!429711))

(declare-fun m!429713 () Bool)

(assert (=> b!444344 m!429713))

(declare-fun m!429715 () Bool)

(assert (=> start!40410 m!429715))

(declare-fun m!429717 () Bool)

(assert (=> start!40410 m!429717))

(declare-fun m!429719 () Bool)

(assert (=> b!444354 m!429719))

(check-sat (not start!40410) tp_is_empty!11809 (not b!444344) (not b!444350) (not b!444354) (not b!444348) (not b!444355) (not mapNonEmpty!19341) (not b!444349) (not b!444353))
(check-sat)
