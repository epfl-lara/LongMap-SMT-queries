; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31038 () Bool)

(assert start!31038)

(declare-fun b!312264 () Bool)

(declare-fun e!194725 () Bool)

(declare-fun e!194724 () Bool)

(assert (=> b!312264 (= e!194725 e!194724)))

(declare-fun res!168769 () Bool)

(assert (=> b!312264 (=> (not res!168769) (not e!194724))))

(declare-datatypes ((array!15953 0))(
  ( (array!15954 (arr!7558 (Array (_ BitVec 32) (_ BitVec 64))) (size!7910 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15953)

(declare-datatypes ((SeekEntryResult!2663 0))(
  ( (MissingZero!2663 (index!12828 (_ BitVec 32))) (Found!2663 (index!12829 (_ BitVec 32))) (Intermediate!2663 (undefined!3475 Bool) (index!12830 (_ BitVec 32)) (x!31145 (_ BitVec 32))) (Undefined!2663) (MissingVacant!2663 (index!12831 (_ BitVec 32))) )
))
(declare-fun lt!152955 () SeekEntryResult!2663)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152951 () SeekEntryResult!2663)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312264 (= res!168769 (and (= lt!152955 lt!152951) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7558 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15953 (_ BitVec 32)) SeekEntryResult!2663)

(assert (=> b!312264 (= lt!152955 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312265 () Bool)

(declare-fun res!168774 () Bool)

(declare-fun e!194726 () Bool)

(assert (=> b!312265 (=> (not res!168774) (not e!194726))))

(declare-fun arrayContainsKey!0 (array!15953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312265 (= res!168774 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!168771 () Bool)

(assert (=> start!31038 (=> (not res!168771) (not e!194726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31038 (= res!168771 (validMask!0 mask!3709))))

(assert (=> start!31038 e!194726))

(declare-fun array_inv!5508 (array!15953) Bool)

(assert (=> start!31038 (array_inv!5508 a!3293)))

(assert (=> start!31038 true))

(declare-fun b!312266 () Bool)

(declare-fun res!168777 () Bool)

(assert (=> b!312266 (=> (not res!168777) (not e!194725))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312266 (= res!168777 (and (= (select (arr!7558 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7910 a!3293))))))

(declare-fun b!312267 () Bool)

(declare-fun e!194727 () Bool)

(assert (=> b!312267 (= e!194727 true)))

(declare-fun lt!152950 () SeekEntryResult!2663)

(declare-fun lt!152948 () SeekEntryResult!2663)

(assert (=> b!312267 (= lt!152950 lt!152948)))

(declare-datatypes ((Unit!9587 0))(
  ( (Unit!9588) )
))
(declare-fun lt!152953 () Unit!9587)

(declare-fun lt!152954 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9587)

(assert (=> b!312267 (= lt!152953 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152954 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312268 () Bool)

(assert (=> b!312268 (= e!194726 e!194725)))

(declare-fun res!168775 () Bool)

(assert (=> b!312268 (=> (not res!168775) (not e!194725))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312268 (= res!168775 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152951))))

(assert (=> b!312268 (= lt!152951 (Intermediate!2663 false resIndex!52 resX!52))))

(declare-fun b!312269 () Bool)

(declare-fun res!168770 () Bool)

(assert (=> b!312269 (=> (not res!168770) (not e!194726))))

(assert (=> b!312269 (= res!168770 (and (= (size!7910 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7910 a!3293))))))

(declare-fun b!312270 () Bool)

(declare-fun res!168773 () Bool)

(assert (=> b!312270 (=> (not res!168773) (not e!194726))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15953 (_ BitVec 32)) SeekEntryResult!2663)

(assert (=> b!312270 (= res!168773 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2663 i!1240)))))

(declare-fun b!312271 () Bool)

(declare-fun res!168768 () Bool)

(assert (=> b!312271 (=> (not res!168768) (not e!194726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312271 (= res!168768 (validKeyInArray!0 k0!2441))))

(declare-fun b!312272 () Bool)

(declare-fun res!168776 () Bool)

(assert (=> b!312272 (=> (not res!168776) (not e!194726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15953 (_ BitVec 32)) Bool)

(assert (=> b!312272 (= res!168776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312273 () Bool)

(assert (=> b!312273 (= e!194724 (not e!194727))))

(declare-fun res!168772 () Bool)

(assert (=> b!312273 (=> res!168772 e!194727)))

(assert (=> b!312273 (= res!168772 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152954 #b00000000000000000000000000000000) (bvsge lt!152954 (size!7910 a!3293)) (not (= lt!152948 lt!152951))))))

(declare-fun lt!152952 () SeekEntryResult!2663)

(assert (=> b!312273 (= lt!152952 lt!152950)))

(declare-fun lt!152949 () array!15953)

(assert (=> b!312273 (= lt!152950 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152954 k0!2441 lt!152949 mask!3709))))

(assert (=> b!312273 (= lt!152952 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152949 mask!3709))))

(assert (=> b!312273 (= lt!152949 (array!15954 (store (arr!7558 a!3293) i!1240 k0!2441) (size!7910 a!3293)))))

(assert (=> b!312273 (= lt!152955 lt!152948)))

(assert (=> b!312273 (= lt!152948 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152954 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312273 (= lt!152954 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(assert (= (and start!31038 res!168771) b!312269))

(assert (= (and b!312269 res!168770) b!312271))

(assert (= (and b!312271 res!168768) b!312265))

(assert (= (and b!312265 res!168774) b!312270))

(assert (= (and b!312270 res!168773) b!312272))

(assert (= (and b!312272 res!168776) b!312268))

(assert (= (and b!312268 res!168775) b!312266))

(assert (= (and b!312266 res!168777) b!312264))

(assert (= (and b!312264 res!168769) b!312273))

(assert (= (and b!312273 (not res!168772)) b!312267))

(declare-fun m!322519 () Bool)

(assert (=> b!312266 m!322519))

(declare-fun m!322521 () Bool)

(assert (=> start!31038 m!322521))

(declare-fun m!322523 () Bool)

(assert (=> start!31038 m!322523))

(declare-fun m!322525 () Bool)

(assert (=> b!312270 m!322525))

(declare-fun m!322527 () Bool)

(assert (=> b!312267 m!322527))

(declare-fun m!322529 () Bool)

(assert (=> b!312264 m!322529))

(declare-fun m!322531 () Bool)

(assert (=> b!312264 m!322531))

(declare-fun m!322533 () Bool)

(assert (=> b!312268 m!322533))

(assert (=> b!312268 m!322533))

(declare-fun m!322535 () Bool)

(assert (=> b!312268 m!322535))

(declare-fun m!322537 () Bool)

(assert (=> b!312265 m!322537))

(declare-fun m!322539 () Bool)

(assert (=> b!312272 m!322539))

(declare-fun m!322541 () Bool)

(assert (=> b!312273 m!322541))

(declare-fun m!322543 () Bool)

(assert (=> b!312273 m!322543))

(declare-fun m!322545 () Bool)

(assert (=> b!312273 m!322545))

(declare-fun m!322547 () Bool)

(assert (=> b!312273 m!322547))

(declare-fun m!322549 () Bool)

(assert (=> b!312273 m!322549))

(declare-fun m!322551 () Bool)

(assert (=> b!312271 m!322551))

(check-sat (not b!312271) (not b!312268) (not b!312264) (not b!312265) (not b!312267) (not start!31038) (not b!312273) (not b!312272) (not b!312270))
(check-sat)
