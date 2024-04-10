; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30530 () Bool)

(assert start!30530)

(declare-fun b!305494 () Bool)

(declare-fun res!162674 () Bool)

(declare-fun e!191844 () Bool)

(assert (=> b!305494 (=> (not res!162674) (not e!191844))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305494 (= res!162674 (validKeyInArray!0 k!2441))))

(declare-fun b!305495 () Bool)

(declare-fun e!191843 () Bool)

(assert (=> b!305495 (= e!191843 (not true))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!305495 (= index!1781 resIndex!52)))

(declare-datatypes ((Unit!9401 0))(
  ( (Unit!9402) )
))
(declare-fun lt!150762 () Unit!9401)

(declare-fun e!191841 () Unit!9401)

(assert (=> b!305495 (= lt!150762 e!191841)))

(declare-fun c!49013 () Bool)

(assert (=> b!305495 (= c!49013 (not (= resIndex!52 index!1781)))))

(declare-fun b!305496 () Bool)

(declare-fun res!162675 () Bool)

(assert (=> b!305496 (=> (not res!162675) (not e!191844))))

(declare-datatypes ((array!15534 0))(
  ( (array!15535 (arr!7352 (Array (_ BitVec 32) (_ BitVec 64))) (size!7704 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15534)

(declare-fun arrayContainsKey!0 (array!15534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305496 (= res!162675 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305497 () Bool)

(declare-fun res!162672 () Bool)

(assert (=> b!305497 (=> (not res!162672) (not e!191843))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2492 0))(
  ( (MissingZero!2492 (index!12144 (_ BitVec 32))) (Found!2492 (index!12145 (_ BitVec 32))) (Intermediate!2492 (undefined!3304 Bool) (index!12146 (_ BitVec 32)) (x!30407 (_ BitVec 32))) (Undefined!2492) (MissingVacant!2492 (index!12147 (_ BitVec 32))) )
))
(declare-fun lt!150761 () SeekEntryResult!2492)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15534 (_ BitVec 32)) SeekEntryResult!2492)

(assert (=> b!305497 (= res!162672 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150761))))

(declare-fun b!305498 () Bool)

(declare-fun Unit!9403 () Unit!9401)

(assert (=> b!305498 (= e!191841 Unit!9403)))

(declare-fun b!305500 () Bool)

(declare-fun res!162677 () Bool)

(assert (=> b!305500 (=> (not res!162677) (not e!191843))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!305500 (= res!162677 (and (= (select (arr!7352 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7704 a!3293))))))

(declare-fun b!305501 () Bool)

(assert (=> b!305501 (= e!191844 e!191843)))

(declare-fun res!162679 () Bool)

(assert (=> b!305501 (=> (not res!162679) (not e!191843))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305501 (= res!162679 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150761))))

(assert (=> b!305501 (= lt!150761 (Intermediate!2492 false resIndex!52 resX!52))))

(declare-fun b!305502 () Bool)

(declare-fun res!162681 () Bool)

(assert (=> b!305502 (=> (not res!162681) (not e!191844))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15534 (_ BitVec 32)) SeekEntryResult!2492)

(assert (=> b!305502 (= res!162681 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2492 i!1240)))))

(declare-fun b!305503 () Bool)

(declare-fun res!162680 () Bool)

(assert (=> b!305503 (=> (not res!162680) (not e!191844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15534 (_ BitVec 32)) Bool)

(assert (=> b!305503 (= res!162680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305504 () Bool)

(declare-fun e!191845 () Unit!9401)

(assert (=> b!305504 (= e!191841 e!191845)))

(declare-fun c!49014 () Bool)

(assert (=> b!305504 (= c!49014 (or (= (select (arr!7352 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7352 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305505 () Bool)

(declare-fun res!162673 () Bool)

(assert (=> b!305505 (=> (not res!162673) (not e!191844))))

(assert (=> b!305505 (= res!162673 (and (= (size!7704 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7704 a!3293))))))

(declare-fun b!305499 () Bool)

(assert (=> b!305499 false))

(declare-fun Unit!9404 () Unit!9401)

(assert (=> b!305499 (= e!191845 Unit!9404)))

(declare-fun res!162678 () Bool)

(assert (=> start!30530 (=> (not res!162678) (not e!191844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30530 (= res!162678 (validMask!0 mask!3709))))

(assert (=> start!30530 e!191844))

(declare-fun array_inv!5315 (array!15534) Bool)

(assert (=> start!30530 (array_inv!5315 a!3293)))

(assert (=> start!30530 true))

(declare-fun b!305506 () Bool)

(declare-fun res!162676 () Bool)

(assert (=> b!305506 (=> (not res!162676) (not e!191843))))

(assert (=> b!305506 (= res!162676 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7352 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!305507 () Bool)

(assert (=> b!305507 false))

(declare-fun lt!150760 () SeekEntryResult!2492)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305507 (= lt!150760 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9405 () Unit!9401)

(assert (=> b!305507 (= e!191845 Unit!9405)))

(assert (= (and start!30530 res!162678) b!305505))

(assert (= (and b!305505 res!162673) b!305494))

(assert (= (and b!305494 res!162674) b!305496))

(assert (= (and b!305496 res!162675) b!305502))

(assert (= (and b!305502 res!162681) b!305503))

(assert (= (and b!305503 res!162680) b!305501))

(assert (= (and b!305501 res!162679) b!305500))

(assert (= (and b!305500 res!162677) b!305497))

(assert (= (and b!305497 res!162672) b!305506))

(assert (= (and b!305506 res!162676) b!305495))

(assert (= (and b!305495 c!49013) b!305504))

(assert (= (and b!305495 (not c!49013)) b!305498))

(assert (= (and b!305504 c!49014) b!305499))

(assert (= (and b!305504 (not c!49014)) b!305507))

(declare-fun m!316445 () Bool)

(assert (=> b!305496 m!316445))

(declare-fun m!316447 () Bool)

(assert (=> b!305506 m!316447))

(assert (=> b!305504 m!316447))

(declare-fun m!316449 () Bool)

(assert (=> b!305494 m!316449))

(declare-fun m!316451 () Bool)

(assert (=> b!305497 m!316451))

(declare-fun m!316453 () Bool)

(assert (=> start!30530 m!316453))

(declare-fun m!316455 () Bool)

(assert (=> start!30530 m!316455))

(declare-fun m!316457 () Bool)

(assert (=> b!305502 m!316457))

(declare-fun m!316459 () Bool)

(assert (=> b!305503 m!316459))

(declare-fun m!316461 () Bool)

(assert (=> b!305500 m!316461))

(declare-fun m!316463 () Bool)

(assert (=> b!305501 m!316463))

(assert (=> b!305501 m!316463))

(declare-fun m!316465 () Bool)

(assert (=> b!305501 m!316465))

(declare-fun m!316467 () Bool)

(assert (=> b!305507 m!316467))

(assert (=> b!305507 m!316467))

(declare-fun m!316469 () Bool)

(assert (=> b!305507 m!316469))

(push 1)

