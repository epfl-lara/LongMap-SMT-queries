; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31014 () Bool)

(assert start!31014)

(declare-fun b!311683 () Bool)

(declare-fun res!168286 () Bool)

(declare-fun e!194403 () Bool)

(assert (=> b!311683 (=> (not res!168286) (not e!194403))))

(declare-datatypes ((array!15920 0))(
  ( (array!15921 (arr!7542 (Array (_ BitVec 32) (_ BitVec 64))) (size!7895 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15920)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311683 (= res!168286 (and (= (select (arr!7542 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7895 a!3293))))))

(declare-fun b!311684 () Bool)

(declare-fun e!194401 () Bool)

(assert (=> b!311684 (= e!194401 e!194403)))

(declare-fun res!168290 () Bool)

(assert (=> b!311684 (=> (not res!168290) (not e!194403))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2681 0))(
  ( (MissingZero!2681 (index!12900 (_ BitVec 32))) (Found!2681 (index!12901 (_ BitVec 32))) (Intermediate!2681 (undefined!3493 Bool) (index!12902 (_ BitVec 32)) (x!31129 (_ BitVec 32))) (Undefined!2681) (MissingVacant!2681 (index!12903 (_ BitVec 32))) )
))
(declare-fun lt!152413 () SeekEntryResult!2681)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15920 (_ BitVec 32)) SeekEntryResult!2681)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311684 (= res!168290 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152413))))

(assert (=> b!311684 (= lt!152413 (Intermediate!2681 false resIndex!52 resX!52))))

(declare-fun b!311685 () Bool)

(declare-fun res!168284 () Bool)

(assert (=> b!311685 (=> (not res!168284) (not e!194401))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15920 (_ BitVec 32)) SeekEntryResult!2681)

(assert (=> b!311685 (= res!168284 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2681 i!1240)))))

(declare-fun b!311686 () Bool)

(declare-fun res!168288 () Bool)

(assert (=> b!311686 (=> (not res!168288) (not e!194401))))

(assert (=> b!311686 (= res!168288 (and (= (size!7895 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7895 a!3293))))))

(declare-fun b!311687 () Bool)

(declare-fun e!194405 () Bool)

(assert (=> b!311687 (= e!194405 true)))

(declare-fun lt!152409 () SeekEntryResult!2681)

(declare-fun lt!152407 () SeekEntryResult!2681)

(assert (=> b!311687 (= lt!152409 lt!152407)))

(declare-fun lt!152412 () (_ BitVec 32))

(declare-datatypes ((Unit!9565 0))(
  ( (Unit!9566) )
))
(declare-fun lt!152411 () Unit!9565)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15920 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9565)

(assert (=> b!311687 (= lt!152411 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152412 resIndex!52 resX!52 mask!3709))))

(declare-fun b!311688 () Bool)

(declare-fun e!194402 () Bool)

(assert (=> b!311688 (= e!194403 e!194402)))

(declare-fun res!168285 () Bool)

(assert (=> b!311688 (=> (not res!168285) (not e!194402))))

(declare-fun lt!152414 () SeekEntryResult!2681)

(assert (=> b!311688 (= res!168285 (and (= lt!152414 lt!152413) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7542 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311688 (= lt!152414 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311689 () Bool)

(declare-fun res!168291 () Bool)

(assert (=> b!311689 (=> (not res!168291) (not e!194401))))

(declare-fun arrayContainsKey!0 (array!15920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311689 (= res!168291 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311690 () Bool)

(assert (=> b!311690 (= e!194402 (not e!194405))))

(declare-fun res!168289 () Bool)

(assert (=> b!311690 (=> res!168289 e!194405)))

(assert (=> b!311690 (= res!168289 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152412 #b00000000000000000000000000000000) (bvsge lt!152412 (size!7895 a!3293)) (not (= lt!152407 lt!152413))))))

(declare-fun lt!152410 () SeekEntryResult!2681)

(assert (=> b!311690 (= lt!152410 lt!152409)))

(declare-fun lt!152408 () array!15920)

(assert (=> b!311690 (= lt!152409 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152412 k0!2441 lt!152408 mask!3709))))

(assert (=> b!311690 (= lt!152410 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152408 mask!3709))))

(assert (=> b!311690 (= lt!152408 (array!15921 (store (arr!7542 a!3293) i!1240 k0!2441) (size!7895 a!3293)))))

(assert (=> b!311690 (= lt!152414 lt!152407)))

(assert (=> b!311690 (= lt!152407 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152412 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311690 (= lt!152412 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311691 () Bool)

(declare-fun res!168283 () Bool)

(assert (=> b!311691 (=> (not res!168283) (not e!194401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311691 (= res!168283 (validKeyInArray!0 k0!2441))))

(declare-fun res!168287 () Bool)

(assert (=> start!31014 (=> (not res!168287) (not e!194401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31014 (= res!168287 (validMask!0 mask!3709))))

(assert (=> start!31014 e!194401))

(declare-fun array_inv!5514 (array!15920) Bool)

(assert (=> start!31014 (array_inv!5514 a!3293)))

(assert (=> start!31014 true))

(declare-fun b!311682 () Bool)

(declare-fun res!168282 () Bool)

(assert (=> b!311682 (=> (not res!168282) (not e!194401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15920 (_ BitVec 32)) Bool)

(assert (=> b!311682 (= res!168282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31014 res!168287) b!311686))

(assert (= (and b!311686 res!168288) b!311691))

(assert (= (and b!311691 res!168283) b!311689))

(assert (= (and b!311689 res!168291) b!311685))

(assert (= (and b!311685 res!168284) b!311682))

(assert (= (and b!311682 res!168282) b!311684))

(assert (= (and b!311684 res!168290) b!311683))

(assert (= (and b!311683 res!168286) b!311688))

(assert (= (and b!311688 res!168285) b!311690))

(assert (= (and b!311690 (not res!168289)) b!311687))

(declare-fun m!321247 () Bool)

(assert (=> b!311687 m!321247))

(declare-fun m!321249 () Bool)

(assert (=> b!311685 m!321249))

(declare-fun m!321251 () Bool)

(assert (=> b!311684 m!321251))

(assert (=> b!311684 m!321251))

(declare-fun m!321253 () Bool)

(assert (=> b!311684 m!321253))

(declare-fun m!321255 () Bool)

(assert (=> start!31014 m!321255))

(declare-fun m!321257 () Bool)

(assert (=> start!31014 m!321257))

(declare-fun m!321259 () Bool)

(assert (=> b!311683 m!321259))

(declare-fun m!321261 () Bool)

(assert (=> b!311682 m!321261))

(declare-fun m!321263 () Bool)

(assert (=> b!311689 m!321263))

(declare-fun m!321265 () Bool)

(assert (=> b!311691 m!321265))

(declare-fun m!321267 () Bool)

(assert (=> b!311690 m!321267))

(declare-fun m!321269 () Bool)

(assert (=> b!311690 m!321269))

(declare-fun m!321271 () Bool)

(assert (=> b!311690 m!321271))

(declare-fun m!321273 () Bool)

(assert (=> b!311690 m!321273))

(declare-fun m!321275 () Bool)

(assert (=> b!311690 m!321275))

(declare-fun m!321277 () Bool)

(assert (=> b!311688 m!321277))

(declare-fun m!321279 () Bool)

(assert (=> b!311688 m!321279))

(check-sat (not b!311691) (not b!311687) (not start!31014) (not b!311690) (not b!311682) (not b!311689) (not b!311684) (not b!311685) (not b!311688))
(check-sat)
