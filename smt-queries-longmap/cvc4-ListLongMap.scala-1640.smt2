; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30608 () Bool)

(assert start!30608)

(declare-fun b!307195 () Bool)

(declare-fun res!163999 () Bool)

(declare-fun e!192417 () Bool)

(assert (=> b!307195 (=> (not res!163999) (not e!192417))))

(declare-datatypes ((array!15625 0))(
  ( (array!15626 (arr!7397 (Array (_ BitVec 32) (_ BitVec 64))) (size!7749 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15625)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15625 (_ BitVec 32)) Bool)

(assert (=> b!307195 (= res!163999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307196 () Bool)

(declare-fun res!164002 () Bool)

(assert (=> b!307196 (=> (not res!164002) (not e!192417))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307196 (= res!164002 (and (= (size!7749 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7749 a!3293))))))

(declare-fun b!307197 () Bool)

(declare-fun res!164000 () Bool)

(assert (=> b!307197 (=> (not res!164000) (not e!192417))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2502 0))(
  ( (MissingZero!2502 (index!12184 (_ BitVec 32))) (Found!2502 (index!12185 (_ BitVec 32))) (Intermediate!2502 (undefined!3314 Bool) (index!12186 (_ BitVec 32)) (x!30534 (_ BitVec 32))) (Undefined!2502) (MissingVacant!2502 (index!12187 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15625 (_ BitVec 32)) SeekEntryResult!2502)

(assert (=> b!307197 (= res!164000 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2502 i!1240)))))

(declare-fun b!307198 () Bool)

(declare-fun res!164006 () Bool)

(declare-fun e!192416 () Bool)

(assert (=> b!307198 (=> (not res!164006) (not e!192416))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307198 (= res!164006 (and (= (select (arr!7397 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7749 a!3293))))))

(declare-fun b!307199 () Bool)

(assert (=> b!307199 (= e!192417 e!192416)))

(declare-fun res!164007 () Bool)

(assert (=> b!307199 (=> (not res!164007) (not e!192416))))

(declare-fun lt!151128 () SeekEntryResult!2502)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15625 (_ BitVec 32)) SeekEntryResult!2502)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307199 (= res!164007 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151128))))

(assert (=> b!307199 (= lt!151128 (Intermediate!2502 false resIndex!52 resX!52))))

(declare-fun b!307200 () Bool)

(declare-fun res!164001 () Bool)

(assert (=> b!307200 (=> (not res!164001) (not e!192417))))

(declare-fun arrayContainsKey!0 (array!15625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307200 (= res!164001 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!164005 () Bool)

(assert (=> start!30608 (=> (not res!164005) (not e!192417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30608 (= res!164005 (validMask!0 mask!3709))))

(assert (=> start!30608 e!192417))

(declare-fun array_inv!5347 (array!15625) Bool)

(assert (=> start!30608 (array_inv!5347 a!3293)))

(assert (=> start!30608 true))

(declare-fun b!307201 () Bool)

(declare-fun res!164004 () Bool)

(assert (=> b!307201 (=> (not res!164004) (not e!192416))))

(assert (=> b!307201 (= res!164004 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151128))))

(declare-fun b!307202 () Bool)

(assert (=> b!307202 (= e!192416 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7397 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!307203 () Bool)

(declare-fun res!164003 () Bool)

(assert (=> b!307203 (=> (not res!164003) (not e!192417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307203 (= res!164003 (validKeyInArray!0 k!2441))))

(assert (= (and start!30608 res!164005) b!307196))

(assert (= (and b!307196 res!164002) b!307203))

(assert (= (and b!307203 res!164003) b!307200))

(assert (= (and b!307200 res!164001) b!307197))

(assert (= (and b!307197 res!164000) b!307195))

(assert (= (and b!307195 res!163999) b!307199))

(assert (= (and b!307199 res!164007) b!307198))

(assert (= (and b!307198 res!164006) b!307201))

(assert (= (and b!307201 res!164004) b!307202))

(declare-fun m!317711 () Bool)

(assert (=> b!307198 m!317711))

(declare-fun m!317713 () Bool)

(assert (=> start!30608 m!317713))

(declare-fun m!317715 () Bool)

(assert (=> start!30608 m!317715))

(declare-fun m!317717 () Bool)

(assert (=> b!307202 m!317717))

(declare-fun m!317719 () Bool)

(assert (=> b!307201 m!317719))

(declare-fun m!317721 () Bool)

(assert (=> b!307199 m!317721))

(assert (=> b!307199 m!317721))

(declare-fun m!317723 () Bool)

(assert (=> b!307199 m!317723))

(declare-fun m!317725 () Bool)

(assert (=> b!307195 m!317725))

(declare-fun m!317727 () Bool)

(assert (=> b!307197 m!317727))

(declare-fun m!317729 () Bool)

(assert (=> b!307203 m!317729))

(declare-fun m!317731 () Bool)

(assert (=> b!307200 m!317731))

(push 1)

(assert (not b!307195))

(assert (not start!30608))

(assert (not b!307199))

(assert (not b!307197))

(assert (not b!307201))

(assert (not b!307203))

(assert (not b!307200))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

