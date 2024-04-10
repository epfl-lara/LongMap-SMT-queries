; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30232 () Bool)

(assert start!30232)

(declare-fun res!159956 () Bool)

(declare-fun e!190672 () Bool)

(assert (=> start!30232 (=> (not res!159956) (not e!190672))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30232 (= res!159956 (validMask!0 mask!3709))))

(assert (=> start!30232 e!190672))

(declare-datatypes ((array!15338 0))(
  ( (array!15339 (arr!7257 (Array (_ BitVec 32) (_ BitVec 64))) (size!7609 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15338)

(declare-fun array_inv!5220 (array!15338) Bool)

(assert (=> start!30232 (array_inv!5220 a!3293)))

(assert (=> start!30232 true))

(declare-fun b!302464 () Bool)

(declare-fun res!159953 () Bool)

(assert (=> b!302464 (=> (not res!159953) (not e!190672))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2397 0))(
  ( (MissingZero!2397 (index!11764 (_ BitVec 32))) (Found!2397 (index!11765 (_ BitVec 32))) (Intermediate!2397 (undefined!3209 Bool) (index!11766 (_ BitVec 32)) (x!30038 (_ BitVec 32))) (Undefined!2397) (MissingVacant!2397 (index!11767 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15338 (_ BitVec 32)) SeekEntryResult!2397)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302464 (= res!159953 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2397 false resIndex!52 resX!52)))))

(declare-fun b!302465 () Bool)

(declare-fun res!159952 () Bool)

(assert (=> b!302465 (=> (not res!159952) (not e!190672))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15338 (_ BitVec 32)) SeekEntryResult!2397)

(assert (=> b!302465 (= res!159952 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2397 i!1240)))))

(declare-fun b!302466 () Bool)

(declare-fun res!159957 () Bool)

(assert (=> b!302466 (=> (not res!159957) (not e!190672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302466 (= res!159957 (validKeyInArray!0 k0!2441))))

(declare-fun b!302467 () Bool)

(declare-fun res!159955 () Bool)

(assert (=> b!302467 (=> (not res!159955) (not e!190672))))

(declare-fun arrayContainsKey!0 (array!15338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302467 (= res!159955 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302468 () Bool)

(declare-fun res!159951 () Bool)

(assert (=> b!302468 (=> (not res!159951) (not e!190672))))

(assert (=> b!302468 (= res!159951 (and (= (size!7609 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7609 a!3293))))))

(declare-fun b!302469 () Bool)

(assert (=> b!302469 (= e!190672 false)))

(declare-fun lt!150093 () SeekEntryResult!2397)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302469 (= lt!150093 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!302470 () Bool)

(declare-fun res!159950 () Bool)

(assert (=> b!302470 (=> (not res!159950) (not e!190672))))

(assert (=> b!302470 (= res!159950 (and (= (select (arr!7257 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7609 a!3293))))))

(declare-fun b!302471 () Bool)

(declare-fun res!159954 () Bool)

(assert (=> b!302471 (=> (not res!159954) (not e!190672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15338 (_ BitVec 32)) Bool)

(assert (=> b!302471 (= res!159954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30232 res!159956) b!302468))

(assert (= (and b!302468 res!159951) b!302466))

(assert (= (and b!302466 res!159957) b!302467))

(assert (= (and b!302467 res!159955) b!302465))

(assert (= (and b!302465 res!159952) b!302471))

(assert (= (and b!302471 res!159954) b!302464))

(assert (= (and b!302464 res!159953) b!302470))

(assert (= (and b!302470 res!159950) b!302469))

(declare-fun m!313987 () Bool)

(assert (=> b!302470 m!313987))

(declare-fun m!313989 () Bool)

(assert (=> b!302464 m!313989))

(assert (=> b!302464 m!313989))

(declare-fun m!313991 () Bool)

(assert (=> b!302464 m!313991))

(declare-fun m!313993 () Bool)

(assert (=> b!302471 m!313993))

(declare-fun m!313995 () Bool)

(assert (=> b!302466 m!313995))

(declare-fun m!313997 () Bool)

(assert (=> start!30232 m!313997))

(declare-fun m!313999 () Bool)

(assert (=> start!30232 m!313999))

(declare-fun m!314001 () Bool)

(assert (=> b!302467 m!314001))

(declare-fun m!314003 () Bool)

(assert (=> b!302469 m!314003))

(declare-fun m!314005 () Bool)

(assert (=> b!302465 m!314005))

(check-sat (not b!302464) (not b!302471) (not b!302467) (not b!302465) (not b!302469) (not b!302466) (not start!30232))
