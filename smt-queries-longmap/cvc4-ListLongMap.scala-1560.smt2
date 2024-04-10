; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29654 () Bool)

(assert start!29654)

(declare-fun b!299176 () Bool)

(declare-fun e!188979 () Bool)

(assert (=> b!299176 (= e!188979 (not true))))

(declare-fun lt!148755 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2308 0))(
  ( (MissingZero!2308 (index!11405 (_ BitVec 32))) (Found!2308 (index!11406 (_ BitVec 32))) (Intermediate!2308 (undefined!3120 Bool) (index!11407 (_ BitVec 32)) (x!29643 (_ BitVec 32))) (Undefined!2308) (MissingVacant!2308 (index!11408 (_ BitVec 32))) )
))
(declare-fun lt!148760 () SeekEntryResult!2308)

(declare-datatypes ((array!15118 0))(
  ( (array!15119 (arr!7159 (Array (_ BitVec 32) (_ BitVec 64))) (size!7511 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15118)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((Unit!9327 0))(
  ( (Unit!9328) )
))
(declare-fun lt!148758 () Unit!9327)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!15118 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9327)

(assert (=> b!299176 (= lt!148758 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!148755 (index!11407 lt!148760) (x!29643 lt!148760) mask!3809))))

(assert (=> b!299176 (= (index!11407 lt!148760) i!1256)))

(declare-fun b!299177 () Bool)

(declare-fun e!188981 () Bool)

(declare-fun e!188980 () Bool)

(assert (=> b!299177 (= e!188981 e!188980)))

(declare-fun res!157739 () Bool)

(assert (=> b!299177 (=> (not res!157739) (not e!188980))))

(declare-fun lt!148756 () Bool)

(declare-fun lt!148757 () SeekEntryResult!2308)

(assert (=> b!299177 (= res!157739 (or lt!148756 (= lt!148757 (MissingVacant!2308 i!1256))))))

(assert (=> b!299177 (= lt!148756 (= lt!148757 (MissingZero!2308 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15118 (_ BitVec 32)) SeekEntryResult!2308)

(assert (=> b!299177 (= lt!148757 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!157746 () Bool)

(assert (=> start!29654 (=> (not res!157746) (not e!188981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29654 (= res!157746 (validMask!0 mask!3809))))

(assert (=> start!29654 e!188981))

(assert (=> start!29654 true))

(declare-fun array_inv!5122 (array!15118) Bool)

(assert (=> start!29654 (array_inv!5122 a!3312)))

(declare-fun b!299178 () Bool)

(declare-fun e!188982 () Bool)

(assert (=> b!299178 (= e!188980 e!188982)))

(declare-fun res!157742 () Bool)

(assert (=> b!299178 (=> (not res!157742) (not e!188982))))

(assert (=> b!299178 (= res!157742 (and (not lt!148756) (= lt!148757 (MissingVacant!2308 i!1256))))))

(declare-fun lt!148759 () SeekEntryResult!2308)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15118 (_ BitVec 32)) SeekEntryResult!2308)

(assert (=> b!299178 (= lt!148759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148755 k!2524 (array!15119 (store (arr!7159 a!3312) i!1256 k!2524) (size!7511 a!3312)) mask!3809))))

(assert (=> b!299178 (= lt!148760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148755 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299178 (= lt!148755 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!299179 () Bool)

(assert (=> b!299179 (= e!188982 e!188979)))

(declare-fun res!157740 () Bool)

(assert (=> b!299179 (=> (not res!157740) (not e!188979))))

(declare-fun lt!148761 () Bool)

(assert (=> b!299179 (= res!157740 (and (or lt!148761 (not (undefined!3120 lt!148760))) (not lt!148761) (= (select (arr!7159 a!3312) (index!11407 lt!148760)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!299179 (= lt!148761 (not (is-Intermediate!2308 lt!148760)))))

(declare-fun b!299180 () Bool)

(declare-fun res!157741 () Bool)

(assert (=> b!299180 (=> (not res!157741) (not e!188980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15118 (_ BitVec 32)) Bool)

(assert (=> b!299180 (= res!157741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!299181 () Bool)

(declare-fun res!157745 () Bool)

(assert (=> b!299181 (=> (not res!157745) (not e!188981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299181 (= res!157745 (validKeyInArray!0 k!2524))))

(declare-fun b!299182 () Bool)

(declare-fun res!157743 () Bool)

(assert (=> b!299182 (=> (not res!157743) (not e!188981))))

(assert (=> b!299182 (= res!157743 (and (= (size!7511 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7511 a!3312))))))

(declare-fun b!299183 () Bool)

(declare-fun res!157744 () Bool)

(assert (=> b!299183 (=> (not res!157744) (not e!188981))))

(declare-fun arrayContainsKey!0 (array!15118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299183 (= res!157744 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29654 res!157746) b!299182))

(assert (= (and b!299182 res!157743) b!299181))

(assert (= (and b!299181 res!157745) b!299183))

(assert (= (and b!299183 res!157744) b!299177))

(assert (= (and b!299177 res!157739) b!299180))

(assert (= (and b!299180 res!157741) b!299178))

(assert (= (and b!299178 res!157742) b!299179))

(assert (= (and b!299179 res!157740) b!299176))

(declare-fun m!311535 () Bool)

(assert (=> b!299178 m!311535))

(declare-fun m!311537 () Bool)

(assert (=> b!299178 m!311537))

(declare-fun m!311539 () Bool)

(assert (=> b!299178 m!311539))

(declare-fun m!311541 () Bool)

(assert (=> b!299178 m!311541))

(declare-fun m!311543 () Bool)

(assert (=> b!299176 m!311543))

(declare-fun m!311545 () Bool)

(assert (=> start!29654 m!311545))

(declare-fun m!311547 () Bool)

(assert (=> start!29654 m!311547))

(declare-fun m!311549 () Bool)

(assert (=> b!299177 m!311549))

(declare-fun m!311551 () Bool)

(assert (=> b!299180 m!311551))

(declare-fun m!311553 () Bool)

(assert (=> b!299179 m!311553))

(declare-fun m!311555 () Bool)

(assert (=> b!299181 m!311555))

(declare-fun m!311557 () Bool)

(assert (=> b!299183 m!311557))

(push 1)

