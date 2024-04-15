; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31068 () Bool)

(assert start!31068)

(declare-fun b!312492 () Bool)

(declare-fun e!194808 () Bool)

(declare-fun e!194810 () Bool)

(assert (=> b!312492 (= e!194808 (not e!194810))))

(declare-fun res!169092 () Bool)

(assert (=> b!312492 (=> res!169092 e!194810)))

(declare-datatypes ((SeekEntryResult!2708 0))(
  ( (MissingZero!2708 (index!13008 (_ BitVec 32))) (Found!2708 (index!13009 (_ BitVec 32))) (Intermediate!2708 (undefined!3520 Bool) (index!13010 (_ BitVec 32)) (x!31228 (_ BitVec 32))) (Undefined!2708) (MissingVacant!2708 (index!13011 (_ BitVec 32))) )
))
(declare-fun lt!153057 () SeekEntryResult!2708)

(declare-fun lt!153055 () (_ BitVec 32))

(declare-datatypes ((array!15974 0))(
  ( (array!15975 (arr!7569 (Array (_ BitVec 32) (_ BitVec 64))) (size!7922 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15974)

(declare-fun lt!153061 () SeekEntryResult!2708)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!312492 (= res!169092 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153055 #b00000000000000000000000000000000) (bvsge lt!153055 (size!7922 a!3293)) (not (= lt!153057 lt!153061))))))

(declare-fun lt!153062 () SeekEntryResult!2708)

(declare-fun lt!153059 () SeekEntryResult!2708)

(assert (=> b!312492 (= lt!153062 lt!153059)))

(declare-fun lt!153056 () array!15974)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15974 (_ BitVec 32)) SeekEntryResult!2708)

(assert (=> b!312492 (= lt!153059 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153055 k0!2441 lt!153056 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312492 (= lt!153062 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!153056 mask!3709))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312492 (= lt!153056 (array!15975 (store (arr!7569 a!3293) i!1240 k0!2441) (size!7922 a!3293)))))

(declare-fun lt!153058 () SeekEntryResult!2708)

(assert (=> b!312492 (= lt!153058 lt!153057)))

(assert (=> b!312492 (= lt!153057 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153055 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312492 (= lt!153055 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312493 () Bool)

(declare-fun res!169096 () Bool)

(declare-fun e!194807 () Bool)

(assert (=> b!312493 (=> (not res!169096) (not e!194807))))

(declare-fun arrayContainsKey!0 (array!15974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312493 (= res!169096 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312494 () Bool)

(declare-fun res!169097 () Bool)

(assert (=> b!312494 (=> (not res!169097) (not e!194807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15974 (_ BitVec 32)) Bool)

(assert (=> b!312494 (= res!169097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312495 () Bool)

(declare-fun res!169098 () Bool)

(assert (=> b!312495 (=> (not res!169098) (not e!194807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312495 (= res!169098 (validKeyInArray!0 k0!2441))))

(declare-fun res!169100 () Bool)

(assert (=> start!31068 (=> (not res!169100) (not e!194807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31068 (= res!169100 (validMask!0 mask!3709))))

(assert (=> start!31068 e!194807))

(declare-fun array_inv!5541 (array!15974) Bool)

(assert (=> start!31068 (array_inv!5541 a!3293)))

(assert (=> start!31068 true))

(declare-fun b!312496 () Bool)

(declare-fun e!194809 () Bool)

(assert (=> b!312496 (= e!194807 e!194809)))

(declare-fun res!169101 () Bool)

(assert (=> b!312496 (=> (not res!169101) (not e!194809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312496 (= res!169101 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153061))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!312496 (= lt!153061 (Intermediate!2708 false resIndex!52 resX!52))))

(declare-fun b!312497 () Bool)

(assert (=> b!312497 (= e!194810 true)))

(assert (=> b!312497 (= lt!153059 lt!153057)))

(declare-datatypes ((Unit!9619 0))(
  ( (Unit!9620) )
))
(declare-fun lt!153060 () Unit!9619)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15974 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9619)

(assert (=> b!312497 (= lt!153060 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153055 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312498 () Bool)

(declare-fun res!169094 () Bool)

(assert (=> b!312498 (=> (not res!169094) (not e!194807))))

(assert (=> b!312498 (= res!169094 (and (= (size!7922 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7922 a!3293))))))

(declare-fun b!312499 () Bool)

(declare-fun res!169095 () Bool)

(assert (=> b!312499 (=> (not res!169095) (not e!194807))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15974 (_ BitVec 32)) SeekEntryResult!2708)

(assert (=> b!312499 (= res!169095 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2708 i!1240)))))

(declare-fun b!312500 () Bool)

(declare-fun res!169093 () Bool)

(assert (=> b!312500 (=> (not res!169093) (not e!194809))))

(assert (=> b!312500 (= res!169093 (and (= (select (arr!7569 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7922 a!3293))))))

(declare-fun b!312501 () Bool)

(assert (=> b!312501 (= e!194809 e!194808)))

(declare-fun res!169099 () Bool)

(assert (=> b!312501 (=> (not res!169099) (not e!194808))))

(assert (=> b!312501 (= res!169099 (and (= lt!153058 lt!153061) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7569 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312501 (= lt!153058 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!31068 res!169100) b!312498))

(assert (= (and b!312498 res!169094) b!312495))

(assert (= (and b!312495 res!169098) b!312493))

(assert (= (and b!312493 res!169096) b!312499))

(assert (= (and b!312499 res!169095) b!312494))

(assert (= (and b!312494 res!169097) b!312496))

(assert (= (and b!312496 res!169101) b!312500))

(assert (= (and b!312500 res!169093) b!312501))

(assert (= (and b!312501 res!169099) b!312492))

(assert (= (and b!312492 (not res!169092)) b!312497))

(declare-fun m!322165 () Bool)

(assert (=> b!312497 m!322165))

(declare-fun m!322167 () Bool)

(assert (=> b!312494 m!322167))

(declare-fun m!322169 () Bool)

(assert (=> b!312492 m!322169))

(declare-fun m!322171 () Bool)

(assert (=> b!312492 m!322171))

(declare-fun m!322173 () Bool)

(assert (=> b!312492 m!322173))

(declare-fun m!322175 () Bool)

(assert (=> b!312492 m!322175))

(declare-fun m!322177 () Bool)

(assert (=> b!312492 m!322177))

(declare-fun m!322179 () Bool)

(assert (=> b!312501 m!322179))

(declare-fun m!322181 () Bool)

(assert (=> b!312501 m!322181))

(declare-fun m!322183 () Bool)

(assert (=> b!312500 m!322183))

(declare-fun m!322185 () Bool)

(assert (=> b!312495 m!322185))

(declare-fun m!322187 () Bool)

(assert (=> b!312499 m!322187))

(declare-fun m!322189 () Bool)

(assert (=> start!31068 m!322189))

(declare-fun m!322191 () Bool)

(assert (=> start!31068 m!322191))

(declare-fun m!322193 () Bool)

(assert (=> b!312496 m!322193))

(assert (=> b!312496 m!322193))

(declare-fun m!322195 () Bool)

(assert (=> b!312496 m!322195))

(declare-fun m!322197 () Bool)

(assert (=> b!312493 m!322197))

(check-sat (not b!312493) (not b!312497) (not b!312501) (not b!312496) (not b!312495) (not b!312499) (not b!312494) (not b!312492) (not start!31068))
(check-sat)
